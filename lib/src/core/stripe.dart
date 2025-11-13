import 'dart:io';
import 'dart:math';

import 'package:alfred/alfred.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/core.dart';
import '../models/models.dart';
import '../utils/platform.dart';

class StripeSubscriptionStore extends Store {
  List<SubscriptionStoreProduct>? _platformProducts = [];
  List<SubscriptionStripeProduct>? _storeProducts = [];

  StripeSubscriptionStore({
    required super.dio,
    required super.endpoints,
    required super.streamController,
  });

  Future<List<SubscriptionStripeProduct>> _queryStoreProducts(
    List<CrosspayEntitlement> entitlements,
  ) async {
    if (_storeProducts?.isNotEmpty == true) {
      return _storeProducts!;
    }

    final stripeProductsIds =
        entitlements.expand((e) => e.products.stripe).map((e) => e.id).toList();

    final res = await dio.post<List>(
      endpoints.stripeListProduct,
      data: {"productIds": stripeProductsIds},
      options: Options(
        responseType: ResponseType.json,
      ),
    );

    _storeProducts =
        res.data!.map((e) => SubscriptionStripeProduct.fromJson(e)).toList();

    return _storeProducts!;
  }

  @override
  Future<List<SubscriptionStoreProduct>> queryProducts() async {
    if (_platformProducts?.isNotEmpty == true) {
      return _platformProducts!;
    }

    final entitlements = await listEntitlements();

    final storeProducts = await _queryStoreProducts(entitlements);

    _platformProducts = storeProducts.map((storeProduct) {
      late CrosspayProduct productDeclaration;
      late String accessLevel;

      for (final entitlement in entitlements) {
        final declaration = entitlement.products.stripe
            .firstWhereOrNull((element) => element.id == storeProduct.id);
        if (declaration != null) {
          productDeclaration = declaration;
          accessLevel = entitlement.name;
        }
      }
      return SubscriptionStoreProduct(
        id: storeProduct.id,
        name: storeProduct.name,
        accessLevel: accessLevel,
        currencyCode: storeProduct.price.currency,
        description: storeProduct.description ?? "",
        formattedPrice: storeProduct.price.formattedPrice,
        price: storeProduct.price.price / 100,
        store: SubscriptionStore.stripe,
        subscriptionRecurrenceDays: productDeclaration.recurringPeriod.inDays,
      );
    }).toList();

    return _platformProducts!;
  }

  @override
  Future<void> purchase(
    SubscriptionStoreProduct product,
    String appUserId, {
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

    final port = Random().nextInt(1000) + 8000;
    final res = await dio.post<Map>(
      endpoints.stripeCheckoutSession,
      data: {
        "productId": product.id,
        "appUserId": appUserId,
        "redirectUrl": kIsWeb ? redirectUrl : "http://localhost:$port/success",
        "failureRedirectUrl":
            kIsWeb ? failureRedirectUrl : "http://localhost:$port/failure",
      },
    );

    await launchUrl(Uri.parse(res.data!["url"]));

    if (kIsWindows || kIsLinux) {
      final alfred = Alfred();

      alfred.get("/success", (req, res) async {
        streamController.add(PurchaseEvent(PurchaseEventType.success));
        res.headers.contentType = ContentType.html;
        final data = successHtml ??
            """
        <!DOCTYPE html>
        <html>
          <head>
            <title>Stripe Payment</title>
          </head>
          <body>
            <h1>Payment successful</h1>
            <p>You can close this window now</p>
          </body>
        </html>
        """;

        await res.send(data);

        await alfred.close();
      });

      alfred.get("/failure", (req, res) async {
        streamController.add(PurchaseEvent(PurchaseEventType.canceled));
        res.headers.contentType = ContentType.html;
        final data = failureHtml ??
            """
        <!DOCTYPE html>
        <html>
          <head>
            <title>Stripe Payment</title>
          </head>
          <body>
            <h1>Payment failed</h1>
            <p>You can close this window now</p>
          </body>
        </html>
        """;
        await res.send(data);

        await alfred.close();
      });

      await alfred.listen(port);
    }
  }

  Future<void> cancel() async {
    await dio.post(endpoints.stripeCancelSubscription);
  }
}
