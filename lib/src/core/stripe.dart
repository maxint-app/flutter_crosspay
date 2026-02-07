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
        store: SubscriptionStore.stripe,
        subscriptionRecurrenceDays: entitlement.period.inDays,
      );
    }).toList();

    return _platformProducts!;
  }

  @override
  Future<void> purchase(
    SubscriptionStoreProduct product,
    String customerEmail, {
    required String redirectUrl,
    required String failureRedirectUrl,
    ReplacementMode replacementMode = ReplacementMode.withTimeProration,
  }) async {
    final activeSubscription = await getActiveSubscription(customerEmail);
    final isActive = const [
      SubscriptionStatus.active,
      SubscriptionStatus.gracePeriod,
      SubscriptionStatus.trialing
    ].contains(activeSubscription?.status);

    if (activeSubscription?.productId == product.id && isActive) {
      throw CrosspayException.alreadyActive(
        "User is already subscribed to this product '${product.id}'. "
        "User can not be allowed to purchase the same product again",
      );
    } else if (activeSubscription != null &&
        activeSubscription.store != SubscriptionStore.stripe &&
        activeSubscription.store != SubscriptionStore.stripeSandbox &&
        isActive) {
      throw CrosspayException.crossUpgradeDowngrade(
        "User is already subscribed this product on a different platform ${activeSubscription.store}. "
        "User have to manage subscription on the same platform",
      );
    }

    final res = await dio.post<Map>(
      "${endpoints.stripeCheckoutSession}/${environment.label}",
      data: {
        "product_id": product.id,
        "customer_email": customerEmail,
        "redirect_url": redirectUrl,
        "failure_redirect_url": failureRedirectUrl,
      },
    );

    await launchUrl(Uri.parse(res.data!["url"]),
        mode: LaunchMode.externalApplication);
  }

  Future<void> cancel(String customerEmail) async {
    await dio.post("${endpoints.stripeCancelSubscription}/${environment.label}",
        data: {
          "customer_email": customerEmail,
        });
  }
}
