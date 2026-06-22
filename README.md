# flutter_crosspay

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

Cross-platform in-app purchase plugin for Flutter. Supports Android, iOS, macOS,
Web, Windows, and Linux by [Maxint Inc](https://github.com/maxint-app).

## Features

- **Unified API** - one interface for all platforms, regardless of the
  underlying store
- **Entitlement-based model** - define products once on the Crosspay backend,
  map them to App Store, Google Play, Stripe, and GoCardless or Create from the
  Crosspay dashboard across all platforms
- **Consumables, non-consumables, and subscriptions** - full support for all
  product types
- **Upgrade/downgrade (proration)** - change subscriptions with prorated billing
- **Real-time purchase events** - listen to a stream of purchase successes,
  cancellations, and failures
- **Active entitlement tracking** - query the user's current subscriptions and
  owned products

## Platform Support

| Platform | Store               | Mechanism                                 |
| -------- | ------------------- | ----------------------------------------- |
| Android  | Google Play         | `in_app_purchase_android` (BillingClient) |
| iOS      | App Store           | `in_app_purchase_storekit` (StoreKit)     |
| macOS    | App Store           | `in_app_purchase_storekit` (StoreKit)     |
| Web      | Stripe / GoCardless | Browser redirect to checkout              |
| Windows  | Stripe / GoCardless | Browser redirect to checkout              |
| Linux    | Stripe / GoCardless | Browser redirect to checkout              |

## Installation

Run following in your terminal to add the package to your Flutter project:

```sh
$ flutter pub add flutter_crosspay
```

## Setup 

Follow our docs to setup your Crosspay account and configure your products and entitlements: https://crosspay.dev/docs/

## Usage

### Initialize

Create a `FlutterCrosspay` instance with your Crosspay API key and environment:

```dart
import 'package:flutter_crosspay/flutter_crosspay.dart';

final crosspay = FlutterCrosspay(
  publicKey: 'YOUR_CROSSPAY_PUBLIC_KEY',
  environment: CrosspayEnvironment.sandbox, // or .production
);

// Identify the customer (required before making purchases)
await crosspay.identify('user@example.com');
```

### List available entitlements

Fetch all products/entitlements configured in your Crosspay dashboard:

```dart
final entitlements = await crosspay.listEntitlements();

for (final entitlement in entitlements) {
  print('${entitlement.name} - ${entitlement.entitlementType.name}');
}
```

Each `CrosspayEntitlement` contains store-specific product references
(`.products.playStore`, `.products.appStore`, `.products.stripe`,
`.products.gocardless`).

### Query store products

Get normalized product details (price, currency, recurrence) for a specific
external store:

```dart
// On web/desktop, specify the store:
final products = await crosspay.queryProducts(ExternalStore.stripe);

// On mobile/macOS, the externalStore is ignored (IAP is used):
final iapProducts = await crosspay.queryProducts(ExternalStore.stripe);

for (final product in products) {
  print('${product.name}: ${product.formattedPrice}');
}
```

### Make a purchase

```dart
await crosspay.purchase(
  entitlement,
  externalStore: ExternalStore.stripe,    // stripe or gocardless for web/desktop
  redirectUrl: 'https://yourapp.com/success',
  failureRedirectUrl: 'https://yourapp.com/failure',
);
```

On mobile/macOS, the `externalStore` parameter is ignored - the native IAP flow
is used automatically.

### Upgrade / downgrade a subscription

PlayStore and App Store support this automatically. But for Stripe/GoCardless, we need the hierarchy of products to be defined in the Crosspay dashboard. So make sure to create [Offerings](https://app.crosspay.dev/offerings) in the Crosspay dashboard for the entitlements you want to allow upgrades/downgrades for.

Otherwise, it needs to be done manually like below. Pass the current product and proration mode when changing subscriptions:

```dart
await crosspay.purchase(
  newEntitlement,
  externalStore: ExternalStore.stripe,
  redirectUrl: 'https://yourapp.com/success',
  failureRedirectUrl: 'https://yourapp.com/failure',
  proratedProduct: currentEntitlement.products.stripe,
  prorationMode: ProrationMode.upgrade,   // or ProrationMode.downgrade
);
```

### Listen to purchase events

```dart
crosspay.purchaseEvents.listen((event) {
  switch (event.event) {
    case PurchaseEventType.success:
      print('Purchase completed!');
    case PurchaseEventType.canceled:
      print('User cancelled the purchase.');
    case PurchaseEventType.failed:
      print('Receipt verification failed.');
    case PurchaseEventType.error:
      print('An error occurred during purchase.');
  }
});
```

### Get active entitlements

Check what the user currently owns:

```dart
final activeEntitlements = await crosspay.getActiveEntitlements();

for (final e in activeEntitlements) {
  print('${e.entitlementId} - status: ${e.status.name}, expires: ${e.expiresAt}');
}
```

### Manage subscriptions

```dart
// Android: open Google Play subscription management
launchUrl(Uri.parse(crosspay.playStoreManagementUrl));

// iOS / macOS: open App Store subscription management
launchUrl(Uri.parse(crosspay.appStoreManagementUrl));
```

### Clean up

```dart
crosspay.logout();  // Clears customer identity, stops SSE stream
```

## Configuration

The Crosspay backend must be configured with your products and store mappings.
See the [Crosspay documentation](https://crosspay.dev/docs) for details on setting up
entitlements, products, and store integrations.

## License

MIT - see the [LICENSE](LICENSE) file for details.
