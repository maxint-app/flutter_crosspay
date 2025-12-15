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
      final entitlement = entitlements
          .firstWhere((e) => e.products.stripe.productId == storeProduct.id);

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
    String? successHtml,
    String? failureHtml,
  }) async {
    final activeSubscription = await getActiveSubscription();

    if (activeSubscription?.productId == product.id) {
      throw CrosspayException.alreadyActive(
        "User is already subscribed to this product '${product.id}'. "
        "User can not be allowed to purchase the same product again",
      );
    } else if (activeSubscription != null &&
        activeSubscription.source != SubscriptionStore.stripe) {
      throw CrosspayException.crossUpgradeDowngrade(
        "User is already subscribed this product on a different platform ${activeSubscription.source}. "
        "User have to manage subscription on the same platform",
      );
    }

    final storeProducts = await _queryStoreProducts();
    final storeProduct =
        storeProducts.firstWhere((element) => element.id == product.id);
    await launchUrl(Uri.parse(storeProduct.checkoutUrl));
  }

  Future<void> cancel() async {
    await dio.post(endpoints.gocardlessCancelSubscription);
  }
}
