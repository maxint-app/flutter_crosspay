import 'package:dio/dio.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/core.dart';
import '../models/models.dart';

class StripeSubscriptionStore extends Store {
  List<SubscriptionStoreProduct>? _platformProducts = [];
  List<SubscriptionStripeProduct>? _storeProducts = [];

  StripeSubscriptionStore({
    required super.dio,
    required super.streamController,
    required super.environment,
  });

  Future<List<SubscriptionStripeProduct>> _queryStoreProducts() async {
    if (_storeProducts?.isNotEmpty == true) {
      return _storeProducts!;
    }

    final res = await dio.get<Map>(
      "${endpoints.stripeListProduct}/${environment.label}",
      options: Options(
        responseType: ResponseType.json,
      ),
    );

    _storeProducts = (res.data!["data"] as List)
        .map((e) => SubscriptionStripeProduct.fromJson(e))
        .toList();

    return _storeProducts!;
  }

  @override
  Future<List<SubscriptionStoreProduct>> queryProducts() async {
    if (_platformProducts?.isNotEmpty == true) {
      return _platformProducts!;
    }

    final entitlements = await listEntitlements();

    final storeProducts = await _queryStoreProducts();

    _platformProducts = storeProducts.map((storeProduct) {
      final entitlement = entitlements
          .firstWhere((e) => e.products.stripe?.productId == storeProduct.id);

      return SubscriptionStoreProduct(
        id: storeProduct.id,
        name: storeProduct.name,
        accessLevel: entitlement.name,
        currencyCode: storeProduct.price.currency,
        description: storeProduct.description ?? "",
        formattedPrice: storeProduct.price.formattedPrice,
        price: storeProduct.price.price / 100,
        store: CrosspayStore.stripe,
        subscriptionRecurrenceDays: entitlement.period?.inDays,
        productType: entitlement.entitlementType,
        entitlementId: entitlement.id,
      );
    }).toList();

    return _platformProducts!;
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
    final activeEntitlement = await getActiveEntitlements(customerEmail);

    final isActive = activeEntitlement.any((e) => entitlement.id == e.id);

    if ((isActive, entitlement.entitlementType)
        case (
          true,
          EntitlementType.subscription || EntitlementType.nonConsumable
        )) {
      throw CrosspayException.alreadyActive(
        "User is already ${entitlement.entitlementType == EntitlementType.subscription ? 'subscribed to' : 'purchased'} this entitlement '${entitlement.name}'. "
        "User can not be allowed to purchase the entitlement product again",
      );
    }

    final res = await dio.post<Map>(
      "${endpoints.stripeCheckoutSession}/${environment.label}",
      data: {
        "product_id": entitlement.products.stripe?.productId,
        "customer_email": customerEmail,
        "redirect_url": redirectUrl,
        "failure_redirect_url": failureRedirectUrl,
        "prorated_product_id": proratedProduct?.id,
        "proration_mode": prorationMode?.name,
      },
    );

    await launchUrl(Uri.parse(res.data!["url"]),
        mode: LaunchMode.externalApplication);
  }
}
