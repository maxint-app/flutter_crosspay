part of 'models.dart';

enum SubscriptionStore { appStore, playStore, stripe }

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
    required String name,
    required String description,
    required CrosspayProducts products,
    required int tier,
  }) = _CrosspayEntitlement;

  factory CrosspayEntitlement.fromJson(Map<String, dynamic> json) =>
      _$CrosspayEntitlementFromJson(json);
}

@freezed
class CrosspayProducts with _$CrosspayProducts {
  CrosspayProducts._();
  
  factory CrosspayProducts({
    required List<CrosspayProduct> playStore,
    required List<CrosspayProduct> appStore,
    required List<CrosspayProduct> stripe,
  }) = _CrosspayProducts;

  factory CrosspayProducts.fromJson(Map<String, dynamic> json) =>
      _$CrosspayProductsFromJson(json);

  List<CrosspayProduct> operator [](SubscriptionStore store) {
    switch (store) {
      case SubscriptionStore.appStore:
        return appStore;
      case SubscriptionStore.playStore:
        return playStore;
      case SubscriptionStore.stripe:
        return stripe;
    }
  }
}

@freezed
class CrosspayProduct with _$CrosspayProduct {
  factory CrosspayProduct({
    required String id,
    @JsonKey(
      name: 'recurringPeriodDays',
      fromJson: _durationFromDays,
      toJson: _durationToDays,
    )
    required Duration recurringPeriod,
  }) = _CrosspayProduct;

  factory CrosspayProduct.fromJson(Map<String, dynamic> json) =>
      _$CrosspayProductFromJson(json);
}
