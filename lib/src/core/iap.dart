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
      _finishPendingTransactions();
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

  Future<void> _finishPendingTransactions() async {
    if (kIsMacOS || kIsIOS) {
      final transactions = await SKPaymentQueueWrapper().transactions();
      for (var transaction in transactions) {
        await SKPaymentQueueWrapper().finishTransaction(transaction);
      }
    } else if (kIsAndroid) {
      final entitlements = await listEntitlements();
      final billingClient = InAppPurchase.instance
          .getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
      final purchasesResult = await billingClient.queryPastPurchases(
        applicationUserName: _customerId,
      );

      if (purchasesResult.error != null) {
        throw purchasesResult.error!;
      }

      for (final entitlement in entitlements) {
        for (var purchase in purchasesResult.pastPurchases) {
          final productId = entitlement.products.playStore?.productId;
          final isMatchingProduct = purchase.productID == productId;
          if (isMatchingProduct &&
              entitlement.entitlementType == EntitlementType.consumable &&
              (purchase.status == PurchaseStatus.purchased ||
                  purchase.status == PurchaseStatus.restored)) {
            await billingClient.consumePurchase(purchase);
          }
        }
      }
    }
  }

  Future<List<ProductDetails>> _queryPlatformProducts(
    List<CrosspayEntitlement> entitlements,
  ) async {
    final productIds = entitlements
        .map((s) {
          if (kIsAndroid) {
            return unzipPlayStoreProductId(s.products.playStore!).productId;
          } else {
            return s.products.appStore?.productId;
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

    final store = kIsAndroid ? CrosspayStore.playStore : CrosspayStore.appStore;
    final storeProducts = <SubscriptionStoreProduct>[];

    for (final entitlement in entitlements) {
      if (kIsAndroid &&
          entitlement.entitlementType == EntitlementType.subscription) {
        final (:productId, :basePlanId) =
            unzipPlayStoreProductId(entitlement.products.playStore!);

        final storeProduct = platformProducts.firstWhereOrNull((p) {
          final basePlan = (p as GooglePlayProductDetails)
              .productDetails
              .subscriptionOfferDetails
              ?.firstWhereOrNull((offer) => offer.basePlanId == basePlanId);
          return p.id == productId && basePlan != null;
        });

        if (storeProduct == null) {
          continue;
        }

        final basePlan = (storeProduct as GooglePlayProductDetails)
            .productDetails
            .subscriptionOfferDetails!
            .firstWhere((offer) => offer.basePlanId == basePlanId);

        storeProducts.add(SubscriptionStoreProduct(
          id: entitlement.products.playStore!
              .productId, // Use the original product ID with base plan ID for subscriptions
          name: storeProduct.title,
          accessLevel: entitlement.name,
          currencyCode: basePlan.pricingPhases[0].priceCurrencyCode,
          description: storeProduct.description,
          formattedPrice: basePlan.pricingPhases[0].formattedPrice,
          price: basePlan.pricingPhases[0].priceAmountMicros / 1_000_000,
          store: CrosspayStore.playStore,
          subscriptionRecurrenceDays: entitlement.period?.inDays,
          productType: entitlement.entitlementType,
          entitlementId: entitlement.id,
        ));
      } else {
        final storeProduct = platformProducts.firstWhereOrNull(
          (p) => p.id == entitlement.products[store]?.productId,
        );

        if (storeProduct == null) {
          continue;
        }

        storeProducts.add(SubscriptionStoreProduct(
          id: entitlement.products[store]!
              .productId, // Use the original product ID as the store product ID
          name: storeProduct.title,
          accessLevel: entitlement.name,
          currencyCode: storeProduct.currencyCode,
          description: storeProduct.description,
          formattedPrice: storeProduct.price,
          price: storeProduct.rawPrice,
          store: store,
          subscriptionRecurrenceDays: entitlement.period?.inDays,
          productType: entitlement.entitlementType,
          entitlementId: entitlement.id,
        ));
      }
    }

    _storeProducts = storeProducts;

    return _storeProducts!;
  }

  @override
  Future<void> purchase(
    CrosspayEntitlement entitlement,
    String customerEmail, {
    CrosspayProduct? proratedProduct,
    ProrationMode? prorationMode,
    required String redirectUrl,
    required String failureRedirectUrl,
    ReplacementMode replacementMode = ReplacementMode.withTimeProration,
  }) async {
    final entitlements = await listEntitlements();
    final platformProducts = await _queryPlatformProducts(entitlements);

    String? selectedOfferToken;
    final platformProduct = platformProducts.firstWhere(
      (p) {
        print(
          "Platform product: ${p.id}\n"
          "Name: ${p.title}\n"
          "Description: ${p.description}\n"
          "Price: ${p.price}\n"
          "Currency code: ${p.currencyCode}\n"
          "Entitlement product ID: ${entitlement.products.playStore?.productId ?? entitlement.products.appStore?.productId}\n"
          "Entitlement store: ${kIsAndroid ? 'playStore' : 'appStore'}\n"
          "Base plans: ${(p is GooglePlayProductDetails) ? p.productDetails.subscriptionOfferDetails?.map((offer) => offer.basePlanId).join(', ') : 'N/A'}\n"
          "-----------------------------------\n",
        );

        final store =
            kIsAndroid ? CrosspayStore.playStore : CrosspayStore.appStore;
        final product = entitlement.products[store];

        /// Android product ids are productId:basePlanId for subscriptions
        /// This extracts the product id and base plan id
        if (kIsAndroid &&
            entitlement.entitlementType == EntitlementType.subscription) {
          final (:productId, :basePlanId) = unzipPlayStoreProductId(product!);

          return (p as GooglePlayProductDetails)
                  .productDetails
                  .subscriptionOfferDetails
                  ?.any((offer) {
                if (offer.basePlanId == basePlanId && p.id == productId) {
                  selectedOfferToken = offer.offerIdToken;
                  return true;
                }
                return false;
              }) ??
              false;
        }

        return p.id == product?.productId;
      },
      orElse: () => throw Exception('Product not found'),
    );

    final purchaseParam = kIsAndroid
        ? GooglePlayPurchaseParam(
            productDetails: platformProduct,
            applicationUserName: _customerId,
            offerToken: selectedOfferToken,
          )
        : PurchaseParam(
            productDetails: platformProduct,
            applicationUserName: _customerId,
          );

    final activeEntitlements = await getActiveEntitlements(customerEmail);

    /// Subscription and non-consumable products should not be allowed to be purchased
    /// if the user already has an active entitlement for that product
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

    /// Handling Google Play Store upgrade/downgrade
    if (kIsAndroid && prorationMode != null && proratedProduct != null) {
      final billingClient = InAppPurchase.instance
          .getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
      final oldPurchaseDetails = await billingClient.queryPastPurchases(
        applicationUserName: _customerId,
      );

      if (oldPurchaseDetails.error != null) {
        throw oldPurchaseDetails.error!;
      }

      final oldActiveEntitlement = activeEntitlements
          .firstWhereOrNull((e) => e.productId == proratedProduct.productId);

      final playStoreSyncedProducts =
          kIsAndroid && oldPurchaseDetails.pastPurchases.isNotEmpty
              ? await syncPlayStorePurchases(
                  customerEmail,
                  oldPurchaseDetails.pastPurchases,
                )
              : null;

      final oldPurchase = oldPurchaseDetails.pastPurchases.firstWhereOrNull(
        (p) {
          if (kIsAndroid) {
            final purchaseProduct = playStoreSyncedProducts?.firstWhereOrNull(
                (s) => s.receipt == p.verificationData.serverVerificationData);
            final oldPlayStoreProductInfo = oldActiveEntitlement == null
                ? null
                : unzipPlayStoreEntitlementProductId(oldActiveEntitlement);

            return purchaseProduct != null &&
                purchaseProduct.productId ==
                    oldPlayStoreProductInfo?.productId &&
                (p.status == PurchaseStatus.purchased ||
                    p.status == PurchaseStatus.restored);
          }

          return p.productID == oldActiveEntitlement?.productId &&
              (p.status == PurchaseStatus.purchased ||
                  p.status == PurchaseStatus.restored);
        },
      );

      if (oldPurchase != null) {
        final purchaseParam = GooglePlayPurchaseParam(
          applicationUserName: _customerId,
          productDetails: platformProduct,
          offerToken: selectedOfferToken,
          changeSubscriptionParam: ChangeSubscriptionParam(
            replacementMode: replacementMode,
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
