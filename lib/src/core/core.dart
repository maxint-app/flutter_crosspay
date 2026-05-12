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
  activeEntitlements: "/entitlements/active",
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

  /// Get the active [CrosspayStorableEntitlement]
  ///
  /// This gives the active entitlements stored in DB. This is usually not used
  /// that much but it has receipts and expiration details.
  Future<List<CrosspayStorableEntitlement>> getActiveEntitlements(
    String customerEmail,
  ) async {
    try {
      final res =
          await dio.post<Map<String, dynamic>?>(endpoints.activeEntitlements,
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

      return (res.data?["data"] as List)
          .map((d) => CrosspayStorableEntitlement.fromJson(d))
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
    final entitlements = await getActiveEntitlements(customerEmail);

    final products = <SubscriptionStoreProduct>[];
    final storeProduct = await queryProducts();

    for (final entitlement in entitlements) {
      if (const [
        SubscriptionStatus.onHold,
        SubscriptionStatus.expired,
      ].contains(entitlement.status)) {
        continue;
      }
      final product = storeProduct.firstWhereOrNull(
        (p) => p.id == entitlement.productId && p.store == entitlement.store,
      );
      if (product == null) continue;
      products.add(product);
    }

    return products;
  }
}
