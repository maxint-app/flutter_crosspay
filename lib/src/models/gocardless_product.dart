part of './models.dart';

@freezed
sealed class SubscriptionGocardlessProduct with _$SubscriptionGocardlessProduct {
  factory SubscriptionGocardlessProduct({
    required String id,
    required String name,
    String? description,
    @JsonKey(name: "formatted_price") required String formattedPrice,
    required int price,
    required String currency,
  }) = _SubscriptionGocardlessProduct;

  factory SubscriptionGocardlessProduct.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionGocardlessProductFromJson(json);
}
