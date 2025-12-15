import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_crosspay/src/core/gocardless.dart';
import './core/iap.dart';
import './core/stripe.dart';
import './models/models.dart';
import './utils/platform.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';

class CrosspayEndpoints {
  final String entitlements;
  final String verifyPurchase;
  final String activeProduct;
  final String stripeListProduct;
  final String gocardlessListProduct;
  final String stripeCheckoutSession;
  final String stripeCancelSubscription;
  final String gocardlessCancelSubscription;

  const CrosspayEndpoints({
    required this.entitlements,
    required this.verifyPurchase,
    required this.activeProduct,
    required this.stripeListProduct,
    required this.stripeCheckoutSession,
    required this.stripeCancelSubscription,
    required this.gocardlessListProduct,
    required this.gocardlessCancelSubscription,
  });
}

enum CrosspayEnvironment {
  production("prod"),
  sandbox("sandbox");

  final String label;
  const CrosspayEnvironment(this.label);
}

class FlutterCrosspay {
  String? _customerEmail;
  final StreamController<PurchaseEvent> _streamController;

  late final InAppPurchaseSubscriptionStore _iapStore;
  late final StripeSubscriptionStore _stripeStore;
  late final GocardlessSubscriptionStore _gocardlessStore;
  final Dio dio;

  final String publicKey;

  /// Create a new instance of FlutterCrosspay.
  ///
  /// [customerEmail] is the user id to use for purchases.
  /// This is to identify the user in the server and grant access accordingly.
  /// You can call [identify] and [logout] to set and unset the user id later.
  /// But this must be set (if not set) before calling [purchase].
  FlutterCrosspay({
    required this.publicKey,
    required CrosspayEnvironment environment,
    String baseUrl = "https://api.crosspy.dev/v1/tenant",
    String? customerEmail,
  })  : dio = Dio(BaseOptions(baseUrl: baseUrl, headers: {
          "api-key": publicKey,
        })),
        _customerEmail = customerEmail,
        _streamController = StreamController<PurchaseEvent>.broadcast() {
    _iapStore = InAppPurchaseSubscriptionStore(
      dio: dio,
      streamController: _streamController,
      environment: environment,
    );
    _stripeStore = StripeSubscriptionStore(
      dio: dio,
      streamController: _streamController,
      environment: environment,
    );
    _gocardlessStore = GocardlessSubscriptionStore(
      dio: dio,
      streamController: _streamController,
      environment: environment,
    );
  }

  Stream<PurchaseEvent> get purchaseEvents => _streamController.stream;

  void identify(String customerEmail) {
    _customerEmail = customerEmail;
  }

  void logout() {
    _customerEmail = null;
  }

  Future<List<SubscriptionStoreProduct>> queryProducts(
      ExternalStore externalStore) async {
    if (kIsMobile || kIsMacOS) {
      return _iapStore.queryProducts();
    } else {
      return switch (externalStore) {
        ExternalStore.stripe => _stripeStore.queryProducts(),
        ExternalStore.gocardless => _gocardlessStore.queryProducts(),
      };
    }
  }

  Future<void> purchase(
    SubscriptionStoreProduct product, {
    required ExternalStore externalStore,
    required String redirectUrl,
    required String failureRedirectUrl,
    ReplacementMode replacementMode = ReplacementMode.withTimeProration,
  }) async {
    if (_customerEmail == null) {
      throw Exception('customer email is not set');
    }

    if (kIsMobile || kIsMacOS) {
      return _iapStore.purchase(
        product,
        _customerEmail!,
        redirectUrl: redirectUrl,
        failureRedirectUrl: failureRedirectUrl,
        replacementMode: replacementMode,
      );
    } else {
      return switch (externalStore) {
        ExternalStore.stripe => _stripeStore.purchase(
            product,
            _customerEmail!,
            redirectUrl: redirectUrl,
            failureRedirectUrl: failureRedirectUrl,
            replacementMode: replacementMode,
          ),
        ExternalStore.gocardless => _gocardlessStore.purchase(
            product,
            _customerEmail!,
            redirectUrl: redirectUrl,
            failureRedirectUrl: failureRedirectUrl,
            replacementMode: replacementMode,
          ),
      };
    }
  }

  /// Get the active [StorableSubscription]
  ///
  /// This gives the active subscription stored in DB. This is usually not used
  /// that much but it has receipts and expiration details.
  Future<StorableSubscription?> getActiveSubscription(
      ExternalStore externalStore) async {
    if (kIsMobile || kIsMacOS) {
      return _iapStore.getActiveSubscription();
    } else {
      return switch (externalStore) {
        ExternalStore.stripe => _stripeStore.getActiveSubscription(),
        ExternalStore.gocardless => _gocardlessStore.getActiveSubscription(),
      };
    }
  }

  /// Get the active [SubscriptionStoreProduct]
  Future<SubscriptionStoreProduct?> activeProduct(
      ExternalStore externalStore) async {
    if (kIsMobile || kIsMacOS) {
      return _iapStore.activeProduct();
    } else {
      return switch (externalStore) {
        ExternalStore.stripe => _stripeStore.activeProduct(),
        ExternalStore.gocardless => _gocardlessStore.activeProduct(),
      };
    }
  }

  Future<List<CrosspayEntitlement>> listEntitlements(
      ExternalStore externalStore) async {
    if (kIsMobile || kIsMacOS) {
      return _iapStore.listEntitlements();
    } else {
      return switch (externalStore) {
        ExternalStore.stripe => _stripeStore.listEntitlements(),
        ExternalStore.gocardless => _gocardlessStore.listEntitlements(),
      };
    }
  }

  Future<CrosspayEntitlement?> activeEntitlement(
      ExternalStore externalStore) async {
    if (kIsMobile || kIsMacOS) {
      return _iapStore.activeEntitlement();
    } else {
      return switch (externalStore) {
        ExternalStore.stripe => _stripeStore.activeEntitlement(),
        ExternalStore.gocardless => _gocardlessStore.activeEntitlement(),
      };
    }
  }

  Future<void> cancelSubscription(ExternalStore externalStore) async {
    final active = await _stripeStore.getActiveSubscription();
    if (kIsLinux ||
        kIsWindows ||
        kIsWeb ||
        active?.source == SubscriptionStore.stripe ||
        active?.source == SubscriptionStore.gocardless) {
      switch (externalStore) {
        case ExternalStore.stripe:
          await _stripeStore.cancel();
        case ExternalStore.gocardless:
          await _gocardlessStore.cancel();
      }
    }
  }

  String get appStoreManagementUrl =>
      "https://apps.apple.com/account/subscriptions";
  String get playStoreManagementUrl =>
      "https://play.google.com/store/account/subscriptions";
}
