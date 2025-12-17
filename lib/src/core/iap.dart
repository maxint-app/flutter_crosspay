import 'dart:async';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';

import '../core/core.dart';
import '../models/models.dart';
import '../utils/platform.dart';

class InAppPurchaseSubscriptionStore extends Store {
  List<SubscriptionStoreProduct>? _storeProducts;
  List<ProductDetails>? _platformProducts;

  InAppPurchaseSubscriptionStore({
    required super.dio,
    required super.streamController,
    required super.environment,
  }) {
    if (kIsMobile || kIsMacOS) {
      _finishAppStorePendingTransactions();
      InAppPurchase.instance.purchaseStream.listen((purchaseDetailsList) async {
        for (final purchaseDetails in purchaseDetailsList) {
          switch (purchaseDetails.status) {
            case PurchaseStatus.pending:
              break;
            case PurchaseStatus.purchased || PurchaseStatus.restored:
              {
                if (kIsIOS || kIsMacOS) {
                  streamController
                      .add(PurchaseEvent(PurchaseEventType.success));
                } else {
                  await _verifyPurchase(purchaseDetails);
                }
                break;
              }
            case PurchaseStatus.canceled:
              streamController.add(PurchaseEvent(PurchaseEventType.canceled));
              break;
            case PurchaseStatus.error:
              streamController.add(PurchaseEvent(PurchaseEventType.error));
              break;
          }
          if (purchaseDetails.pendingCompletePurchase) {
            await InAppPurchase.instance.completePurchase(purchaseDetails);
          }
        }
      });
    }
  }

  Future<void> _finishAppStorePendingTransactions() async {
    if (kIsMacOS || kIsIOS) {
      final transactions = await SKPaymentQueueWrapper().transactions();
      for (var transaction in transactions) {
        await SKPaymentQueueWrapper().finishTransaction(transaction);
      }
    }
  }

  Future<void> _verifyPurchase(PurchaseDetails purchaseDetails) async {
    if (!kIsAndroid) return;
    final res = await dio.post<Map<String, dynamic>?>(
      endpoints.verifyPurchase,
      data: {
        "productId": purchaseDetails.productID,
        "purchaseToken":
            purchaseDetails.verificationData.serverVerificationData,
      },
      options: Options(
        responseType: ResponseType.json,
      ),
    );

    if (res.data?["valid"] == true) {
      streamController.add(PurchaseEvent(PurchaseEventType.success));
    } else {
      streamController.add(PurchaseEvent(PurchaseEventType.failed));
    }
  }

  Future<List<ProductDetails>> _queryPlatformProducts(
    List<CrosspayEntitlement> entitlements,
  ) async {
    final productIds = entitlements
        .map((s) {
          if (kIsAndroid) {
            return s.products.playStore?.id;
          } else if (kIsMacOS || kIsIOS) {
            return s.products.appStore?.id;
          } else {
            return s.products.stripe?.id ?? s.products.gocardless?.id;
          }
        })
        .nonNulls
        .toSet();

    _platformProducts ??= await InAppPurchase.instance
        .queryProductDetails(productIds)
        .then((s) => s.productDetails);

    return _platformProducts!;
  }

  @override
  Future<List<SubscriptionStoreProduct>> queryProducts() async {
    final entitlements = await listEntitlements();
    if (_storeProducts != null) {
      return _storeProducts!;
    }

    final platformProducts = await _queryPlatformProducts(entitlements);

    _storeProducts = platformProducts.map((platformProduct) {
      final entitlement = entitlements.firstWhere((e) {
        if (kIsAndroid) {
          return e.products.playStore?.productId == platformProduct.id;
        }
        return e.products.appStore?.productId == platformProduct.id;
      });

      return SubscriptionStoreProduct(
        id: platformProduct.id,
        name: platformProduct.title,
        accessLevel: entitlement.name,
        currencyCode: platformProduct.currencyCode,
        description: platformProduct.description,
        formattedPrice: platformProduct.price,
        price: platformProduct.rawPrice,
        store: kIsAndroid
            ? SubscriptionStore.playStore
            : SubscriptionStore.appStore,
        subscriptionRecurrenceDays: entitlement.period.inDays,
      );
    }).toList();

    return _storeProducts!;
  }

  @override
  Future<void> purchase(
    SubscriptionStoreProduct product,
    String customerEmail, {
    required String redirectUrl,
    required String failureRedirectUrl,
    ReplacementMode replacementMode = ReplacementMode.withTimeProration,
  }) async {
    final entitlements = await listEntitlements();
    final platformProducts = await _queryPlatformProducts(entitlements);

    final platformProduct = platformProducts.firstWhere(
      (p) => p.id == product.id,
      orElse: () => throw Exception('Product not found'),
    );

    final purchaseParam = PurchaseParam(
      productDetails: platformProduct,
      applicationUserName: customerEmail,
    );

    final activeSubscription = await getActiveSubscription();

    if (activeSubscription != null &&
        activeSubscription.productId == product.id) {
      throw CrosspayException.alreadyActive(
        "User is already subscribed to this product '${product.id}'. "
        "User can not be allowed to purchase the same product again",
      );
    } else if (activeSubscription != null &&
        (kIsAndroid &&
                activeSubscription.source != SubscriptionStore.playStore ||
            (kIsIOS || kIsMacOS) &&
                activeSubscription.source != SubscriptionStore.appStore)) {
      throw CrosspayException.crossUpgradeDowngrade(
        "User is already subscribed this product on a different platform ${activeSubscription.source}. "
        "User have to manage subscription on the same platform",
      );
    }

    /// Automatically handling Google Play Store upgrade/downgrade
    if (kIsAndroid && activeSubscription != null) {
      final billingClient = InAppPurchase.instance
          .getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
      final oldPurchaseDetails = await billingClient.queryPastPurchases(
        applicationUserName: customerEmail,
      );

      if (oldPurchaseDetails.error != null) {
        throw oldPurchaseDetails.error!;
      }

      final oldPurchase = oldPurchaseDetails.pastPurchases.firstWhereOrNull(
        (p) =>
            p.productID == activeSubscription.productId &&
            (p.status == PurchaseStatus.purchased ||
                p.status == PurchaseStatus.restored),
      );

      if (oldPurchase != null) {
        final purchaseParam = GooglePlayPurchaseParam(
          productDetails: platformProduct,
          changeSubscriptionParam: ChangeSubscriptionParam(
            oldPurchaseDetails: oldPurchase,
          ),
        );

        await InAppPurchase.instance
            .buyNonConsumable(purchaseParam: purchaseParam);
        return;
      }
    }

    await InAppPurchase.instance.buyNonConsumable(purchaseParam: purchaseParam);
  }
}
