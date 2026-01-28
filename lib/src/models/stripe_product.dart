part of 'models.dart';

@freezed
sealed class SubscriptionStripeProduct with _$SubscriptionStripeProduct {
  const factory SubscriptionStripeProduct({
    /// Unique identifier for the object.
    required String id,

    /// String representing the object's type. Objects of the same type share the same value.
    @JsonKey(name: 'object') required String objectType,

    /// Whether the product is currently available for purchase.
    required bool active,

    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    required int created,

    /// The ID of the Price object that is the default price for this product.
    required SubscriptionStripePrice price,

    /// Always true for a deleted object
    bool? deleted,

    /// The product's description, meant to be displayable to the customer.
    String? description,

    /// A list of up to 8 URLs of images for this product, meant to be displayable to the customer.
    required List<String> images,

    /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
    required bool livemode,

    /// Set of key-value pairs that you can attach to an object.
    required Map<String, dynamic> metadata,

    /// The product's name, meant to be displayable to the customer.
    required String name,

    /// Whether this product is shipped (i.e., physical goods).
    bool? shippable,

    /// Extra information about a product which will appear on your customer's credit card statement.
    @JsonKey(name: 'statement_descriptor') String? statementDescriptor,

    /// The type of the product. The product is either of type 'good' or 'service'.
    required String type,

    /// A label that represents units of this product.
    @JsonKey(name: 'unit_label') String? unitLabel,

    /// Time at which the object was last updated. Measured in seconds since the Unix epoch.
    required int updated,

    /// A URL of a publicly-accessible webpage for this product.
    String? url,
  }) = _SubscriptionStripeProduct;

  factory SubscriptionStripeProduct.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionStripeProductFromJson(json);
}

@freezed
sealed class SubscriptionStripePrice with _$SubscriptionStripePrice {
  factory SubscriptionStripePrice({
    required String id,
    required int price,
    required String currency,
    required String formattedPrice,
    required String unitLabel,
  }) = _SubscriptionStripePrice;

  factory SubscriptionStripePrice.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionStripePriceFromJson(json);
}
