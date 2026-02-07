import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_client_sse/constants/sse_request_type_enum.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';
import 'package:flutter_crosspay/src/core/core.dart';
import 'package:flutter_crosspay/src/core/gocardless.dart';
import './core/iap.dart';
import './core/stripe.dart';
import './models/models.dart';
import './utils/platform.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';

class CrosspayEndpoints {
  final String entitlements;
  final String identifyCustomer;
  final String activeSubscription;
  final String stripeListProduct;
  final String gocardlessListProduct;
  final String stripeCheckoutSession;
  final String stripeCancelSubscription;
  final String gocardlessBillingRequestFlow;
  final String gocardlessCancelSubscription;
  final String purchasesStream;

  const CrosspayEndpoints({
    required this.entitlements,
    required this.activeSubscription,
    required this.stripeListProduct,
    required this.stripeCheckoutSession,
    required this.stripeCancelSubscription,
    required this.gocardlessBillingRequestFlow,
    required this.gocardlessListProduct,
    required this.gocardlessCancelSubscription,
    required this.purchasesStream,
    required this.identifyCustomer ,
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
    String baseUrl = "https://api.crosspay.dev/tenant",
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

    _listenToSSE();
  }

  final List<StreamSubscription> _subscriptions = [];

  Stream<PurchaseEvent> get purchaseEvents => _streamController.stream;

  void dispose() {
    for (var sub in _subscriptions) {
      sub.cancel();
    }
    _streamController.close();
    SSEClient.unsubscribeFromSSE();
  }

  void _listenToSSE() {
    if (_customerEmail == null) return;
    if ((kIsDesktop || kIsWeb) && !kIsMacOS) {
      final stream = SSEClient.subscribeToSSE(
        method: SSERequestType.GET,
        url:
            "${dio.options.baseUrl}${endpoints.purchasesStream}?customer_email=$_customerEmail",
        header: {
          ...dio.options.headers,
        },
      );

      _subscriptions.add(
        stream.listen(
          (event) {
            if (event.data != null &&
                event.data != "ping" &&
                event.data!.isNotEmpty) {
              _streamController
                  .add(PurchaseEvent.fromJson(jsonDecode(event.data!)));
            }
          },
          onError: (error) {
            debugPrint("SSE Error: $error");
          },
        ),
      );
    }
  }

  Future<void> identify(String customerEmail) async {
    await _iapStore.identifyCustomer(customerEmail);
    _customerEmail = customerEmail;
    _listenToSSE();
  }

  void logout() {
    for (var sub in _subscriptions) {
      sub.cancel();
    }
    _subscriptions.clear();
    SSEClient.unsubscribeFromSSE();
    _customerEmail = null;
  }

  Future<List<SubscriptionStoreProduct>> queryProducts(
    ExternalStore externalStore,
  ) async {
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
      return switch (product.store) {
        SubscriptionStore.stripe ||
        SubscriptionStore.stripeSandbox =>
          _stripeStore.purchase(
            product,
            _customerEmail!,
            redirectUrl: redirectUrl,
            failureRedirectUrl: failureRedirectUrl,
            replacementMode: replacementMode,
          ),
        SubscriptionStore.gocardless ||
        SubscriptionStore.gocardlessSandbox =>
          _gocardlessStore.purchase(
            product,
            _customerEmail!,
            redirectUrl: redirectUrl,
            failureRedirectUrl: failureRedirectUrl,
            replacementMode: replacementMode,
          ),
        _ => throw Exception(
            "Unsupported store ${product.store} for non-mobile platforms",
          ),
      };
    }
  }

  /// Get the active [StorableSubscription]
  ///
  /// This gives the active subscription stored in DB. This is usually not used
  /// that much but it has receipts and expiration details.
  Future<StorableSubscription?> getActiveSubscription() async {
    assert(
      _customerEmail != null,
      "Customer email is not set. Please call identify() to set the customer email before calling getActiveSubscription().",
    );
    return _iapStore.getActiveSubscription(
        _customerEmail!); // this is a core method so same for all platforms
  }

  /// Get the active [SubscriptionStoreProduct]
  Future<SubscriptionStoreProduct?> activeProduct() async {
    assert(
      _customerEmail != null,
      "Customer email is not set. Please call identify() to set the customer email before calling activeProduct().",
    );

    return _iapStore.activeProduct(
        _customerEmail!); // this is a core method so same for all platforms
  }

  Future<List<CrosspayEntitlement>> listEntitlements() async {
    return _iapStore
        .listEntitlements(); // this is a core method so same for all platforms
  }

  Future<CrosspayEntitlement?> activeEntitlement() async {
    assert(
      _customerEmail != null,
      "Customer email is not set. Please call identify() to set the customer email before calling activeEntitlement().",
    );
    return _iapStore.activeEntitlement(
      _customerEmail!,
    ); // this is a core method so same for all platforms
  }

  Future<void> cancelSubscription() async {
    assert(
      _customerEmail != null,
      "Customer email is not set. Please call identify() to set the customer email before calling cancelSubscription().",
    );
    final active = await _stripeStore.getActiveSubscription(_customerEmail!);
    if (kIsLinux ||
        kIsWindows ||
        kIsWeb ||
        active?.store == SubscriptionStore.stripe ||
        active?.store == SubscriptionStore.stripeSandbox ||
        active?.store == SubscriptionStore.gocardless ||
        active?.store == SubscriptionStore.gocardlessSandbox) {
      switch (active?.store) {
        case SubscriptionStore.stripe || SubscriptionStore.stripeSandbox:
          await _stripeStore.cancel(_customerEmail!);
        case SubscriptionStore.gocardless ||
              SubscriptionStore.gocardlessSandbox:
          await _gocardlessStore.cancel(_customerEmail!);
        default:
      }
    }
  }

  String get appStoreManagementUrl =>
      "https://apps.apple.com/account/subscriptions";
  String get playStoreManagementUrl =>
      "https://play.google.com/store/account/subscriptions";
}
