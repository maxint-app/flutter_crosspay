import 'dart:async';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';

import '../crosspay.dart';
import '../models/models.dart';

const endpoints = CrosspayEndpoints(
  entitlements: "/entitlements",
  verifyPurchase: "/verify",
  activeSubscription: "/subscriptions/active",
  stripeListProduct: "/stripe/products",
  stripeCheckoutSession: "/stripe/checkout",
  stripeCancelSubscription: "/stripe/cancel",
  gocardlessListProduct: "/gocardless/products",
  gocardlessCancelSubscription: "/gocardless/cancel",
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
    SubscriptionStoreProduct product,
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
  Future<StorableSubscription?> getActiveSubscription(
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
          });

      if (res.data?["data"] == null) {
        return null;
      }

      return StorableSubscription.fromJson(res.data?["data"]);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
      rethrow;
    }
  }

  /// Get the active [SubscriptionStoreProduct]
  ///
  /// This returns the currently active store product
  ///
  /// It'll return null even if there is an active subscription but the product
  /// is from a different store
  Future<SubscriptionStoreProduct?> activeProduct(String customerEmail) async {
    final subscription = await getActiveSubscription(customerEmail);

    if (subscription == null ||
        const [
          SubscriptionStatus.onHold,
          SubscriptionStatus.expired,
        ].contains(subscription.status)) {
      return null;
    }

    final product = await queryProducts();

    return product.firstWhereOrNull(
      (p) => p.id == subscription.productId,
    );
  }

  Future<CrosspayEntitlement?> activeEntitlement(String customerEmail) async {
    final subscription = await getActiveSubscription(customerEmail);

    if (subscription == null ||
        const [
          SubscriptionStatus.onHold,
          SubscriptionStatus.expired,
        ].contains(subscription.status)) {
      return null;
    }

    final entitlements = await listEntitlements();

    return entitlements.firstWhereOrNull(
      (e) =>
          e.products[subscription.store]?.productId == subscription.productId,
    );
  }
}
