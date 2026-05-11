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
        store: CrosspayStore.gocardless,
        subscriptionRecurrenceDays: entitlement.period.inDays,
      );
    }).toList();

    return _platformProducts!;
  }

  @override
  Future<void> purchase(
    CrosspayEntitlement entitlement,
    String customerEmail, {
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
      "${endpoints.gocardlessBillingRequestFlow}/${environment.label}",
      data: {
        "customer_email": customerEmail,
        "product_id": entitlement.products.gocardless?.productId,
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
}
