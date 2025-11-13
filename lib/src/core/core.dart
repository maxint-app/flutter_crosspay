import 'dart:async';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';

import '../crosspay.dart';
import '../models/models.dart';

abstract class Store {
  final Dio dio;
  final CrosspayEndpoints endpoints;
  List<CrosspayEntitlement>? _entitlements;
  @protected
  final StreamController<PurchaseEvent> streamController;

  Store({
    required this.dio,
    required this.endpoints,
    required this.streamController,
  });

  Future<List<SubscriptionStoreProduct>> queryProducts();
  Future<void> purchase(
    SubscriptionStoreProduct product,
    String appUserId, {
    required String redirectUrl,
    required String failureRedirectUrl,
    ReplacementMode replacementMode = ReplacementMode.withTimeProration,
  });

  Future<List<CrosspayEntitlement>> listEntitlements() async {
    if (_entitlements?.isNotEmpty == true) {
      return _entitlements!;
    }

    final res = await dio.get<List>(
      endpoints.entitlements,
      options: Options(
        responseType: ResponseType.json,
      ),
    );

    if (res.data == null) {
      return [];
    }

    _entitlements =
        (res.data as List).map((e) => CrosspayEntitlement.fromJson(e)).toList();

    return _entitlements!;
  }

  /// Get the active [StorableSubscription]
  ///
  /// This gives the active subscription stored in DB. This is usually not used
  /// that much but it has receipts and expiration details.
  Future<StorableSubscription?> getActiveSubscription() async {
    final res = await dio.get<Map<String, dynamic>?>(
      endpoints.activeProduct,
      options: Options(
        responseType: ResponseType.json,
      ),
    );

    if (res.data == null) {
      return null;
    }

    return StorableSubscription.fromJson(res.data!);
  }

  /// Get the active [SubscriptionStoreProduct]
  ///
  /// This returns the currently active store product
  ///
  /// It'll return null even if there is an active subscription but the product
  /// is from a different store
  Future<SubscriptionStoreProduct?> activeProduct() async {
    final storableSubscription = await getActiveSubscription();

    if (storableSubscription == null) {
      return null;
    }

    final product = await queryProducts();

    return product.firstWhereOrNull(
      (p) => p.id == storableSubscription.productId,
    );
  }

  Future<CrosspayEntitlement?> activeEntitlement() async {
    final subscription = await getActiveSubscription();

    if (subscription == null) {
      return null;
    }

    final entitlements = await listEntitlements();

    return entitlements.firstWhereOrNull(
      (e) => e.products[subscription.source]
          .any((p) => p.id == subscription.productId),
    );
  }
}
