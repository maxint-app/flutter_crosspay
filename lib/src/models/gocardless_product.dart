part of './models.dart';

@freezed
class SubscriptionGocardlessProduct with _$SubscriptionGocardlessProduct {
  factory SubscriptionGocardlessProduct({
    required String id,
    required String name,
    String? description,
    @JsonKey(name: "formatted_price") required String formattedPrice,
    required int price,
    required String currency,
    @JsonKey(name: "checkout_url") required String checkoutUrl,
  }) = _SubscriptionGocardlessProduct;

  factory SubscriptionGocardlessProduct.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionGocardlessProductFromJson(json);
}
