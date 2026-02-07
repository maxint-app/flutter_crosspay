import 'package:dio/dio.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/core.dart';
import '../models/models.dart';

class GocardlessSubscriptionStore extends Store {
  List<SubscriptionStoreProduct>? _platformProducts = [];
  List<SubscriptionGocardlessProduct>? _storeProducts = [];

  GocardlessSubscriptionStore({
    required super.dio,
    required super.streamController,
    required super.environment,
  });

  Future<List<SubscriptionGocardlessProduct>> _queryStoreProducts() async {
    if (_storeProducts?.isNotEmpty == true) {
      return _storeProducts!;
    }

    final res = await dio.get<Map>(
      "${endpoints.gocardlessListProduct}/${environment.label}",
      options: Options(
        responseType: ResponseType.json,
      ),
    );

    _storeProducts = (res.data!["data"] as List)
        .map((e) => SubscriptionGocardlessProduct.fromJson(e))
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
      final entitlement = entitlements.firstWhere(
          (e) => e.products.gocardless?.productId == storeProduct.id);

      return SubscriptionStoreProduct(
        id: storeProduct.id,
        name: storeProduct.name,
        accessLevel: entitlement.name,
        currencyCode: storeProduct.currency,
        description: storeProduct.description ?? "",
        formattedPrice: storeProduct.formattedPrice,
        price: storeProduct.price / 100,
        store: SubscriptionStore.gocardless,
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

    if (activeSubscription?.productId == product.id &&
        const [
          SubscriptionStatus.active,
          SubscriptionStatus.gracePeriod,
          SubscriptionStatus.trialing
        ].contains(activeSubscription?.status)) {
      throw CrosspayException.alreadyActive(
        "User is already subscribed to this product '${product.id}'. "
        "User can not be allowed to purchase the same product again",
      );
    } else if (activeSubscription != null &&
        activeSubscription.store != SubscriptionStore.gocardless) {
      throw CrosspayException.crossUpgradeDowngrade(
        "User is already subscribed this product on a different platform ${activeSubscription.store}. "
        "User have to manage subscription on the same platform",
      );
    }

    final res = await dio.post<Map>(
      "${endpoints.gocardlessBillingRequestFlow}/${environment.label}",
      data: {
        "customer_email": customerEmail,
        "product_id": product.id,
        "redirect_url": redirectUrl,
        "failure_redirect_url": failureRedirectUrl
      },
    );

    final checkoutUrl = res.data?["url"];
    if (checkoutUrl == null) {
      throw Exception("Failed to create GoCardless billing request flow");
    }

    if (!await launchUrl(Uri.parse(checkoutUrl))) {
      throw Exception("Could not launch GoCardless checkout URL");
    }
  }

  Future<void> cancel(String customerEmail) async {
    await dio.post(
        "${endpoints.gocardlessCancelSubscription}/${environment.label}",
        data: {
          "customer_email": customerEmail,
        });
  }
}
