part of 'models.dart';

enum SubscriptionStore { appStore, playStore, stripe, gocardless }
enum ExternalStore { stripe, gocardless }

@freezed
class SubscriptionStoreProduct with _$SubscriptionStoreProduct {
  factory SubscriptionStoreProduct({
    required String id,
    required String name,
    required String description,
    required double price,
    required String formattedPrice,
    required String currencyCode,
    required SubscriptionStore store,
    required int subscriptionRecurrenceDays,
    required String accessLevel,
  }) = _SubscriptionStoreProduct;

  factory SubscriptionStoreProduct.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionStoreProductFromJson(json);
}

@freezed
class CrosspayEntitlement with _$CrosspayEntitlement {
  factory CrosspayEntitlement({
    required String id,
    required String name,
    @JsonKey(name: "period_ms", fromJson: _durationFromMillis, toJson: _durationToMillis)
    required Duration period,
    String? description,
    Map<String, dynamic>? metadata,
    required CrosspayProducts products,
  }) = _CrosspayEntitlement;

  factory CrosspayEntitlement.fromJson(Map<String, dynamic> json) =>
      _$CrosspayEntitlementFromJson(json);
}

@freezed
class CrosspayProducts with _$CrosspayProducts {
  CrosspayProducts._();
  
  factory CrosspayProducts({
    @JsonKey(name: "playstore")
    required CrosspayProduct playStore,
    @JsonKey(name: "appstore")
    required CrosspayProduct appStore,
    required CrosspayProduct stripe,
    required CrosspayProduct gocardless,
  }) = _CrosspayProducts;

  factory CrosspayProducts.fromJson(Map<String, dynamic> json) =>
      _$CrosspayProductsFromJson(json);

  CrosspayProduct operator [](SubscriptionStore store) {
    switch (store) {
      case SubscriptionStore.appStore:
        return appStore;
      case SubscriptionStore.playStore:
        return playStore;
      case SubscriptionStore.stripe:
        return stripe;
      case SubscriptionStore.gocardless:
        return gocardless;
    }
  }
}

@freezed
class CrosspayProduct with _$CrosspayProduct {
  factory CrosspayProduct({
    required String id,
    @JsonKey(name: "product_id")
    required String productId,
    required String name,
    String? description,
    Map<String, dynamic>? metadata,
  }) = _CrosspayProduct;

  factory CrosspayProduct.fromJson(Map<String, dynamic> json) =>
      _$CrosspayProductFromJson(json);
}
