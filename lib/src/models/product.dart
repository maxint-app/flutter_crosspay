part of 'models.dart';

enum CrosspayStore {
  @JsonValue("appstore")
  appStore,
  @JsonValue("playstore")
  playStore,
  @JsonValue("stripe")
  stripe,
  @JsonValue("stripe_sandbox")
  stripeSandbox,
  @JsonValue("gocardless")
  gocardless,
  @JsonValue("gocardless_sandbox")
  gocardlessSandbox,
}

enum ExternalStore { stripe, gocardless }

@freezed
sealed class SubscriptionStoreProduct with _$SubscriptionStoreProduct {
  factory SubscriptionStoreProduct({
    required String id,
    required String name,
    required String description,
    required double price,
    required String formattedPrice,
    required String currencyCode,
    required CrosspayStore store,
    required int? subscriptionRecurrenceDays,
    required String accessLevel,
    required EntitlementType productType,
    required String entitlementId,
  }) = _SubscriptionStoreProduct;

  factory SubscriptionStoreProduct.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionStoreProductFromJson(json);
}

enum EntitlementType {
  @JsonValue("consumable")
  consumable,
  @JsonValue("non_consumable")
  nonConsumable,
  @JsonValue("subscription")
  subscription,
}

enum ProrationMode {
  upgrade,
  downgrade,
}

Map<String, dynamic> _toJsonMetadata(Map<String, dynamic>? metadata) =>
    metadata ?? {};
Map<String, dynamic>? _fromJsonMetadata(dynamic json) {
  if (json is String && json.isNotEmpty) {
    if (json == "null") {
      return null;
    }
    final isRealJson =
        json.trim().startsWith("{") || json.trim().startsWith("[");
    if (isRealJson) {
      return jsonDecode(json) as Map<String, dynamic>?;
    }
    try {
      final decoded = utf8.decode(base64Decode(json));
      return jsonDecode(decoded) as Map<String, dynamic>;
    } catch (e) {
      // If it fails to decode, return an empty map
      return {};
    }
  }
  return json as Map<String, dynamic>?;
}

@freezed
sealed class CrosspayEntitlement with _$CrosspayEntitlement {
  factory CrosspayEntitlement({
    required String id,
    required String name,
    @JsonKey(
        name: "period_ms",
        fromJson: _durationFromMillis,
        toJson: _durationToMillis)
    required Duration? period,
    String? description,
    @JsonKey(fromJson: _fromJsonMetadata, toJson: _toJsonMetadata)
    Map<String, dynamic>? metadata,
    required CrosspayProducts products,
    @JsonKey(name: "entitlement_type") required EntitlementType entitlementType,
  }) = _CrosspayEntitlement;

  factory CrosspayEntitlement.fromJson(Map<String, dynamic> json) =>
      _$CrosspayEntitlementFromJson(json);
}

@freezed
sealed class CrosspayProducts with _$CrosspayProducts {
  CrosspayProducts._();

  factory CrosspayProducts({
    @JsonKey(name: "playstore") CrosspayProduct? playStore,
    @JsonKey(name: "appstore") CrosspayProduct? appStore,
    CrosspayProduct? stripe,
    CrosspayProduct? gocardless,
  }) = _CrosspayProducts;

  factory CrosspayProducts.fromJson(Map<String, dynamic> json) =>
      _$CrosspayProductsFromJson(json);

  CrosspayProduct? operator [](CrosspayStore store) {
    switch (store) {
      case CrosspayStore.appStore:
        return appStore;
      case CrosspayStore.playStore:
        return playStore;
      case CrosspayStore.stripe || CrosspayStore.stripeSandbox:
        return stripe;
      case CrosspayStore.gocardless || CrosspayStore.gocardlessSandbox:
        return gocardless;
    }
  }
}

@freezed
sealed class CrosspayProduct with _$CrosspayProduct {
  factory CrosspayProduct({
    required String id,
    @JsonKey(name: "product_id") required String productId,
    required String name,
    String? description,
    @JsonKey(fromJson: _fromJsonMetadata, toJson: _toJsonMetadata)
    Map<String, dynamic>? metadata,
  }) = _CrosspayProduct;

  factory CrosspayProduct.fromJson(Map<String, dynamic> json) =>
      _$CrosspayProductFromJson(json);
}

@freezed
sealed class CrosspayPlayStorePurchasesSyncProduct
    with _$CrosspayPlayStorePurchasesSyncProduct {
  factory CrosspayPlayStorePurchasesSyncProduct({
    required String id,
    @JsonKey(name: "product_id") required String productId,
    @JsonKey(name: "entitlement_id") required String entitlementId,
    required String name,
    String? description,
    @JsonKey(fromJson: _fromJsonMetadata, toJson: _toJsonMetadata)
    Map<String, dynamic>? metadata,
    required String receipt,
  }) = _CrosspayPlayStorePurchasesSyncProduct;

  factory CrosspayPlayStorePurchasesSyncProduct.fromJson(
          Map<String, dynamic> json) =>
      _$CrosspayPlayStorePurchasesSyncProductFromJson(json);
}

@freezed
sealed class CrosspayStorableEntitlement with _$CrosspayStorableEntitlement {
  factory CrosspayStorableEntitlement({
    required String id,
    @JsonKey(name: "product_id") required String productId,
    @JsonKey(name: "entitlement_id") required String entitlementId,
    @JsonKey(
        name: "expires_at",
        fromJson: _dateTimeFromEpoch,
        toJson: _dateTimeToEpoch)
    required DateTime expiresAt,
    @JsonKey(
        name: "trial_expires_at",
        fromJson: _dateTimeNullableFromEpoch,
        toJson: _dateTimeNullableToEpoch)
    DateTime? trialExpiresAt,
    required CrosspayStore store,
    required EntitlementStatus status,
    @JsonKey(name: "renewal_status")
    required SubscriptionRenewalStatus? renewalStatus,
    @JsonKey(name: "entitlement_type") required EntitlementType entitlementType,
    @JsonKey(name: "purchase_state") String? purchaseState,
  }) = _CrosspayStorableEntitlement;

  factory CrosspayStorableEntitlement.fromJson(Map<String, dynamic> json) =>
      _$CrosspayStorableEntitlementFromJson(json);
}

({String productId, String basePlanId}) unzipPlayStoreProductId(
  CrosspayProduct product,
) {
  final parts = product.productId.split(':');
  if (parts.length == 2) {
    return (productId: parts[0], basePlanId: parts[1]);
  }
  return (productId: product.productId, basePlanId: '');
}

({String productId, String basePlanId}) unzipPlayStoreEntitlementProductId(
  CrosspayStorableEntitlement product,
) {
  final parts = product.productId.split(':');
  if (parts.length == 2) {
    return (productId: parts[0], basePlanId: parts[1]);
  }
  return (productId: product.productId, basePlanId: '');
}
