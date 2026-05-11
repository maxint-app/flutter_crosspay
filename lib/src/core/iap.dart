import 'dart:async';

import 'package:collection/collection.dart';
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
  String? _customerId;

  void setCustomerId(String customerId) {
    _customerId = customerId;
  }

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
                streamController.add(PurchaseEvent(PurchaseEventType.success));
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

  Future<List<ProductDetails>> _queryPlatformProducts(
    List<CrosspayEntitlement> entitlements,
  ) async {
    final productIds = entitlements
        .map((s) {
          if (kIsAndroid) {
            return s.products.playStore?.productId;
          } else if (kIsMacOS || kIsIOS) {
            return s.products.appStore?.productId;
          } else {
            return s.products.stripe?.productId ??
                s.products.gocardless?.productId;
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
    CrosspayEntitlement entitlement,
    String customerEmail, {
    required String redirectUrl,
    required String failureRedirectUrl,
    ReplacementMode replacementMode = ReplacementMode.withTimeProration,
  }) async {
    final entitlements = await listEntitlements();
    final platformProducts = await _queryPlatformProducts(entitlements);

    final platformProduct = platformProducts.firstWhere(
      (p) =>
          p.id == entitlement.products.appStore?.id ||
          p.id == entitlement.products.playStore?.id,
      orElse: () => throw Exception('Product not found'),
    );

    final purchaseParam = PurchaseParam(
      productDetails: platformProduct,
      applicationUserName: _customerId,
    );

    final activeEntitlements = await this.activeEntitlements(customerEmail);
    final isActive = activeEntitlements.any((e) =>
        entitlement.id == e.id &&
        (entitlement.entitlementType == EntitlementType.subscription ||
            entitlement.entitlementType == EntitlementType.nonConsumable));

    if (isActive) {
      throw CrosspayException.alreadyActive(
        "User is already ${entitlement.entitlementType == EntitlementType.subscription ? 'subscribed to' : 'purchased'} this entitlement '${entitlement.name}'. "
        "User can not be allowed to purchase the entitlement product again",
      );
    }

    /// Automatically handling Google Play Store upgrade/downgrade
    if (kIsAndroid && isActive) {
      final billingClient = InAppPurchase.instance
          .getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
      final oldPurchaseDetails = await billingClient.queryPastPurchases(
        applicationUserName: _customerId,
      );

      if (oldPurchaseDetails.error != null) {
        throw oldPurchaseDetails.error!;
      }

      final oldPurchase = oldPurchaseDetails.pastPurchases.firstWhereOrNull(
        (p) {
          final activeEntitlement = activeEntitlements
              .firstWhereOrNull((e) => e.id == entitlement.id);

          return p.productID == activeEntitlement?.products.playStore?.id &&
              (p.status == PurchaseStatus.purchased ||
                  p.status == PurchaseStatus.restored);
        },
      );

      if (oldPurchase != null) {
        final purchaseParam = GooglePlayPurchaseParam(
          applicationUserName: _customerId,
          productDetails: platformProduct,
          changeSubscriptionParam: ChangeSubscriptionParam(
            oldPurchaseDetails: oldPurchase,
          ),
        );

        switch (entitlement.entitlementType) {
          case EntitlementType.nonConsumable || EntitlementType.subscription:
            await InAppPurchase.instance
                .buyNonConsumable(purchaseParam: purchaseParam);
          default:
            await InAppPurchase.instance
                .buyConsumable(purchaseParam: purchaseParam);
        }
        return;
      }
    }

    switch (entitlement.entitlementType) {
      case EntitlementType.nonConsumable || EntitlementType.subscription:
        await InAppPurchase.instance
            .buyNonConsumable(purchaseParam: purchaseParam);
      default:
        await InAppPurchase.instance
            .buyConsumable(purchaseParam: purchaseParam);
    }
  }
}
