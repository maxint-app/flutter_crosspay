import 'dart:async';

import 'package:example/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crosspay/flutter_crosspay.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final FlutterCrosspay crosspay;
  List<CrosspayEntitlement> entitlements = [];
  List<SubscriptionStoreProduct> products = [];
  StorableSubscription? activeSubscription;
  CrosspayEntitlement? activeEntitlement;

  StreamSubscription? _subscription;

  @override
  void initState() {
    crosspay = FlutterCrosspay(
      publicKey: Env.crosspayPublicKey,
      environment: CrosspayEnvironment.sandbox,
      baseUrl: Env.crosspayApiUrl,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await crosspay.identify(Env.userEmail);

      _subscription = crosspay.purchaseEvents.listen((event) {
        debugPrint("Purchase Event: ${event.event}");
      });

      final entitlements = await crosspay.listEntitlements();
      final products = await crosspay.queryProducts(ExternalStore.stripe);
      final activeSubscription = await crosspay.getActiveSubscription();
      final activeEntitlement = await crosspay.activeEntitlement();

      setState(() {
        this.entitlements = entitlements;
        this.products = products;
        this.activeSubscription = activeSubscription;
        this.activeEntitlement = activeEntitlement;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        body: ListView.builder(
          itemCount: entitlements.length,
          itemBuilder: (context, index) {
            final entitlement = entitlements[index];
            final isActive =
                activeEntitlement != null &&
                activeEntitlement!.id == entitlement.id;
            final isReSubscribable =
                isActive &&
                (activeSubscription?.renewalStatus ==
                    SubscriptionRenewalStatus.canceled);
            final storeProduct = products.firstWhere(
              (product) =>
                  entitlement.products[product.store]?.productId == product.id,
            );
            return Card(
              child: ListTile(
                title: Text(
                  '${entitlement.name} - ${entitlement.period.inDays} days ${isActive ? "(active) " : ""}',
                ),
                subtitle: Text(
                  "Price: ${storeProduct.formattedPrice}"
                  "${entitlement.description ?? ''}"
                  "${isActive ? '\nActive until: ${activeSubscription?.expiresAt}'
                            ' Auto-Renew: ${activeSubscription?.renewalStatus.name}' : ''}",
                ),
                trailing: !isActive || isReSubscribable
                    ? FilledButton.tonal(
                        onPressed: () {
                          crosspay.purchase(
                            storeProduct,
                            redirectUrl: "https://example.com/success",
                            failureRedirectUrl: "https://example.com/failure",
                          );
                        },
                        child: isReSubscribable
                            ? const Text("Resubscribe")
                            : const Text("Subscribe"),
                      )
                    : isActive &&
                          const [
                            SubscriptionStore.stripe,
                            SubscriptionStore.stripeSandbox,
                            SubscriptionStore.gocardless,
                            SubscriptionStore.gocardlessSandbox,
                          ].contains(storeProduct.store)
                    ? FilledButton.tonal(
                        onPressed: () async {
                          await crosspay.cancelSubscription();
                        },
                        child: const Text("Cancel"),
                      )
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
