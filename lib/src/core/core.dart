import 'dart:async';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';

import '../crosspay.dart';
import '../models/models.dart';

const endpoints = CrosspayEndpoints(
  identifyCustomer: "/identify",
  entitlements: "/entitlements",
  activeSubscription: "/subscriptions/active",
  stripeListProduct: "/stripe/products",
  stripeCheckoutSession: "/stripe/checkout",
  gocardlessListProduct: "/gocardless/products",
  gocardlessBillingRequestFlow: "/gocardless/billing-request-flow",
  purchasesStream: "/purchases-stream",
);

abstract class Store {
  final CrosspayEnvironment environment;
  final Dio dio;

  List<CrosspayEntitlement>? _entitlements;
  @protected
  final StreamController<PurchaseEvent> streamController;

  Store({
    required this.dio,
    required this.environment,
    required this.streamController,
  });

  Future<List<SubscriptionStoreProduct>> queryProducts();
  Future<void> purchase(
    CrosspayEntitlement entitlement,
    String customerEmail, {
    required String redirectUrl,
    required String failureRedirectUrl,
    ReplacementMode replacementMode = ReplacementMode.withTimeProration,
  });

  Future<List<CrosspayEntitlement>> listEntitlements() async {
    if (_entitlements?.isNotEmpty == true) {
      return _entitlements!;
    }

    final res = await dio.get<Map>(
      "${endpoints.entitlements}/${environment.label}",
      options: Options(
        responseType: ResponseType.json,
      ),
    );

    if (res.data == null) {
      return [];
    }

    _entitlements = ((res.data as Map)["data"] as List)
        .map((e) => CrosspayEntitlement.fromJson(e))
        .toList();

    return _entitlements!;
  }

  /// Get the active [StorableSubscription]
  ///
  /// This gives the active subscription stored in DB. This is usually not used
  /// that much but it has receipts and expiration details.
  Future<List<StorableSubscription>> getActiveSubscriptions(
    String customerEmail,
  ) async {
    try {
      final res =
          await dio.post<Map<String, dynamic>?>(endpoints.activeSubscription,
              options: Options(
                responseType: ResponseType.json,
              ),
              data: {
            "customer_email": customerEmail,
            "environment": environment.label,
          });

      if (res.data?["data"] == null) {
        return [];
      }

      return (res.data?["data"] as List<Map<String, dynamic>>)
          .map(StorableSubscription.fromJson)
          .toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return [];
      }
      rethrow;
    }
  }

  /// Gets the active [List<SubscriptionStoreProduct>]
  ///
  /// This returns the currently active store product
  ///
  /// It'll return null even if there is an active subscription but the product
  /// is from a different store
  Future<List<SubscriptionStoreProduct>> activeProducts(
    String customerEmail,
  ) async {
    final subscriptions = await getActiveSubscriptions(customerEmail);

    final products = <SubscriptionStoreProduct>[];
    final storeProduct = await queryProducts();

    for (final subscription in subscriptions) {
      if (const [
        SubscriptionStatus.onHold,
        SubscriptionStatus.expired,
      ].contains(subscription.status)) {
        continue;
      }
      final product = storeProduct.firstWhereOrNull(
        (p) => p.id == subscription.productId && p.store == subscription.store,
      );
      if (product == null) continue;
      products.add(product);
    }

    return products;
  }

  Future<List<CrosspayEntitlement>> activeEntitlements(
    String customerEmail,
  ) async {
    final subscription = await getActiveSubscriptions(customerEmail);

    final entitlements = await listEntitlements();

    final activeEntitlements = <CrosspayEntitlement>[];

    for (final sub in subscription) {
      if (const [
        SubscriptionStatus.onHold,
        SubscriptionStatus.expired,
      ].contains(sub.status)) {
        continue;
      }
      final entitlement = entitlements.firstWhereOrNull(
        (e) => e.products[sub.store]?.productId == sub.productId,
      );
      if (entitlement != null) {
        activeEntitlements.add(entitlement);
      }
    }

    return activeEntitlements;
  }
}
