import 'dart:io';
import 'dart:math';

import 'package:alfred/alfred.dart';
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
    required super.streamController,
    required super.environment,
  });

  Future<List<SubscriptionStripeProduct>> _queryStoreProducts() async {
    if (_storeProducts?.isNotEmpty == true) {
      return _storeProducts!;
    }

    final res = await dio.get<Map>(
      "${endpoints.stripeListProduct}/${environment.label}",
      options: Options(
        responseType: ResponseType.json,
      ),
    );

    _storeProducts =
        (res.data!["data"] as List).map((e) => SubscriptionStripeProduct.fromJson(e)).toList();

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
          .firstWhere((e) => e.products.stripe?.productId == storeProduct.id);

      return SubscriptionStoreProduct(
        id: storeProduct.id,
        name: storeProduct.name,
        accessLevel: entitlement.name,
        currencyCode: storeProduct.price.currency,
        description: storeProduct.description ?? "",
        formattedPrice: storeProduct.price.formattedPrice,
        price: storeProduct.price.price / 100,
        store: SubscriptionStore.stripe,
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

    final port = Random().nextInt(1000) + 8000;
    final res = await dio.post<Map>(
      "${endpoints.stripeCheckoutSession}/${environment.label}",
      data: {
        "product_id": product.id,
        "customer_email": customerEmail,
        "redirect_url": kIsWeb ? redirectUrl : "http://localhost:$port/success",
        "failure_redirect_url":
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Successful - Maxint</title>
    <style>
        :root {
            --bg-color: #F9F9F9;
            --card-bg: #FFFFFF;
            --text-primary: #1C1C1E;
            --text-secondary: #666666;
            --accent-color: #34C759;
            --button-text: #FFFFFF;
            --border-color: #E5E5E5;
            --shadow: 0 4px 20px rgba(0,0,0,0.05);
        }
        @media (prefers-color-scheme: dark) {
            :root {
                --bg-color: #000000;
                --card-bg: #1C1C1E;
                --text-primary: #FFFFFF;
                --text-secondary: #A1A1AA;
                --accent-color: #34C759;
                --button-text: #000000;
                --border-color: #333333;
                --shadow: 0 4px 20px rgba(0,0,0,0.4);
            }
        }
        body {
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            background-color: var(--bg-color);
            color: var(--text-primary);
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            transition: background-color 0.3s ease;
        }
        .container {
            width: 100%;
            max-width: 420px;
            padding: 20px;
            box-sizing: border-box;
        }
        .card {
            background-color: var(--card-bg);
            border-radius: 32px;
            padding: 40px 32px;
            text-align: center;
            box-shadow: var(--shadow);
            border: 1px solid var(--border-color);
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 24px;
        }
        .icon-wrapper {
            width: 80px;
            height: 80px;
            background-color: rgba(52, 199, 89, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 8px;
            position: relative;
            animation: scaleIn 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
        }
        .checkmark {
            width: 40px;
            height: 40px;
            stroke: var(--accent-color);
            stroke-width: 3;
            stroke-linecap: round;
            stroke-linejoin: round;
            fill: none;
            stroke-dasharray: 100;
            stroke-dashoffset: 100;
            animation: drawCheck 0.6s 0.3s ease-out forwards;
        }
        h1 {
            font-size: 28px;
            font-weight: 700;
            margin: 0;
            letter-spacing: -0.02em;
            color: var(--text-primary);
        }
        p {
            font-size: 16px;
            line-height: 1.5;
            color: var(--text-secondary);
            margin: 0;
            max-width: 280px;
        }
        .btn {
            background-color: var(--accent-color);
            color: var(--button-text);
            font-size: 16px;
            font-weight: 600;
            padding: 16px 32px;
            border-radius: 20px;
            text-decoration: none;
            display: inline-block;
            width: 100%;
            box-sizing: border-box;
            transition: transform 0.2s, opacity 0.2s;
            border: none;
            cursor: pointer;
            margin-top: 16px;
        }
        .btn:active {
            transform: scale(0.98);
            opacity: 0.9;
        }
        @keyframes scaleIn {
            from { transform: scale(0); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }
        @keyframes drawCheck {
            to { stroke-dashoffset: 0; }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="icon-wrapper">
                <svg class="checkmark" viewBox="0 0 24 24">
                    <polyline points="20 6 9 17 4 12"></polyline>
                </svg>
            </div>
            <div>
                <h1>Payment Successful</h1>
                <p style="margin-top: 12px;">Intelligence, Unlocked. Your account has been upgraded to Premium.</p>
            </div>
            <a href="maxint://home" id="returnBtn" class="btn">Return to App</a>
        </div>
    </div>
    <script>
        document.getElementById('returnBtn').addEventListener('click', function(e) {
            setTimeout(function() { window.close(); }, 500);
        });
    </script>
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Failed - Maxint</title>
    <style>
        :root {
            --bg-color: #F9F9F9;
            --card-bg: #FFFFFF;
            --text-primary: #1C1C1E;
            --text-secondary: #666666;
            --accent-color: #FF3B30;
            --button-text: #FFFFFF;
            --border-color: #E5E5E5;
            --shadow: 0 4px 20px rgba(0,0,0,0.05);
        }
        @media (prefers-color-scheme: dark) {
            :root {
                --bg-color: #000000;
                --card-bg: #1C1C1E;
                --text-primary: #FFFFFF;
                --text-secondary: #A1A1AA;
                --accent-color: #FF453A;
                --button-text: #FFFFFF;
                --border-color: #333333;
                --shadow: 0 4px 20px rgba(0,0,0,0.4);
            }
        }
        body {
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            background-color: var(--bg-color);
            color: var(--text-primary);
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            transition: background-color 0.3s ease;
        }
        .container {
            width: 100%;
            max-width: 420px;
            padding: 20px;
            box-sizing: border-box;
        }
        .card {
            background-color: var(--card-bg);
            border-radius: 32px;
            padding: 40px 32px;
            text-align: center;
            box-shadow: var(--shadow);
            border: 1px solid var(--border-color);
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 24px;
        }
        .icon-wrapper {
            width: 80px;
            height: 80px;
            background-color: rgba(255, 59, 48, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 8px;
            position: relative;
            animation: scaleIn 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
        }
        .x-mark {
            width: 40px;
            height: 40px;
            stroke: var(--accent-color);
            stroke-width: 3;
            stroke-linecap: round;
            stroke-linejoin: round;
            fill: none;
            stroke-dasharray: 100;
            stroke-dashoffset: 100;
            animation: drawX 0.6s 0.3s ease-out forwards;
        }
        h1 {
            font-size: 28px;
            font-weight: 700;
            margin: 0;
            letter-spacing: -0.02em;
            color: var(--text-primary);
        }
        p {
            font-size: 16px;
            line-height: 1.5;
            color: var(--text-secondary);
            margin: 0;
            max-width: 280px;
        }
        .btn {
            background-color: var(--accent-color);
            color: var(--button-text);
            font-size: 16px;
            font-weight: 600;
            padding: 16px 32px;
            border-radius: 20px;
            text-decoration: none;
            display: inline-block;
            width: 100%;
            box-sizing: border-box;
            transition: transform 0.2s, opacity 0.2s;
            border: none;
            cursor: pointer;
            margin-top: 16px;
        }
        .btn:active {
            transform: scale(0.98);
            opacity: 0.9;
        }
        @keyframes scaleIn {
            from { transform: scale(0); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }
        @keyframes drawX {
            to { stroke-dashoffset: 0; }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="icon-wrapper">
                <svg class="x-mark" viewBox="0 0 24 24">
                    <line x1="18" y1="6" x2="6" y2="18"></line>
                    <line x1="6" y1="6" x2="18" y2="18"></line>
                </svg>
            </div>
            <div>
                <h1>Payment Failed</h1>
                <p style="margin-top: 12px;">Something went wrong with your payment. Please try again or contact support.</p>
            </div>
            <a href="maxint://home" id="returnBtn" class="btn">Return to App</a>
        </div>
    </div>
    <script>
        document.getElementById('returnBtn').addEventListener('click', function(e) {
            setTimeout(function() { window.close(); }, 500);
        });
    </script>
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
