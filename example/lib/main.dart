import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:example/env.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crosspay/flutter_crosspay.dart';

late final FlutterCrosspay crosspay;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  crosspay = FlutterCrosspay(
    publicKey: Env.crosspayPublicKey,
    environment: !kIsWeb && Platform.isAndroid
        ? CrosspayEnvironment.production
        : CrosspayEnvironment.sandbox,
    baseUrl: Env.crosspayApiUrl,
  );
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<CrosspayEntitlement> entitlements = [];
  List<SubscriptionStoreProduct> products = [];
  List<CrosspayStorableEntitlement> activeEntitlements = [];

  StreamSubscription? _subscription;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await crosspay.identify(Env.userEmail);

      _subscription = crosspay.purchaseEvents.listen((event) {
        debugPrint("Purchase Event: ${event.event}");
      });

      final entitlements = await crosspay.listEntitlements();
      final products = await crosspay.queryProducts(ExternalStore.stripe);
      final activeEntitlements = await crosspay.getActiveEntitlements();

      setState(() {
        this.entitlements = entitlements;
        this.products = products;
        this.activeEntitlements = activeEntitlements;
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
        body: entitlements.isEmpty || products.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: entitlements.length,
                itemBuilder: (context, index) {
                  final entitlement = entitlements[index];
                  final activeSubscription = activeEntitlements
                      .firstWhereOrNull(
                        (s) => s.entitlementId == entitlement.id,
                      );
                  final isActive = activeSubscription != null;
                  final storeProduct = products.firstWhereOrNull(
                    (product) =>
                        entitlement.products[product.store]?.qualifiedProductId(
                          entitlement.entitlementType,
                        ) ==
                        product.id,
                  );
                  return Card(
                    child: ListTile(
                      title: Text(
                        '${entitlement.entitlementType.name} ${entitlement.name} '
                        '${entitlement.entitlementType == EntitlementType.subscription ? '- ${entitlement.period?.inDays ?? 0} days' : ""} '
                        '${isActive ? "(active) " : ""}',
                      ),
                      subtitle: Text(
                        "Price: ${storeProduct?.formattedPrice ?? 'N/A'}"
                        "${entitlement.description ?? ''}"
                        "${isActive ? '\nActive until: ${activeSubscription.expiresAt}'
                                  ' Auto-Renew: ${activeSubscription.renewalStatus?.name}' : ''}",
                      ),
                      trailing: FilledButton.tonal(
                        onPressed: () async {
                          final basicEntitlement = entitlements
                              .firstWhereOrNull(
                                (e) =>
                                    e.name.toLowerCase().contains("basic") &&
                                    e.entitlementType ==
                                        EntitlementType.subscription,
                              );
                          final isUpgrade =
                              entitlement.name.toLowerCase().contains(
                                "standard",
                              ) &&
                              basicEntitlement != null &&
                              activeEntitlements.any(
                                (e) =>
                                    e.entitlementId == basicEntitlement.id &&
                                    e.renewalStatus !=
                                        SubscriptionRenewalStatus.canceled,
                              );

                          if (kIsWeb ||
                              Theme.of(context).platform ==
                                  TargetPlatform.windows ||
                              Theme.of(context).platform ==
                                  TargetPlatform.linux) {
                            final provider = await showDialog<ExternalStore>(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Choose Provide"),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        title: Text("Stripe"),
                                        subtitle: Text(
                                          "Debit/Credit/Paypal, international",
                                        ),
                                        onTap: () {
                                          Navigator.of(
                                            context,
                                          ).pop(ExternalStore.stripe);
                                        },
                                      ),
                                      ListTile(
                                        title: Text("GoCardless"),
                                        subtitle: Text(
                                          "Debit/Direct bank transfer, small fee",
                                        ),
                                        onTap: () {
                                          Navigator.of(
                                            context,
                                          ).pop(ExternalStore.gocardless);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );

                            if (provider == null || !context.mounted) {
                              return;
                            }

                            if (provider == ExternalStore.stripe) {
                              await crosspay.purchase(
                                entitlement,
                                externalStore: ExternalStore.stripe,
                                redirectUrl: "https://example.com/success",
                                failureRedirectUrl:
                                    "https://example.com/failure",
                                proratedProduct: isUpgrade
                                    ? basicEntitlement.products.stripe
                                    : null,
                                prorationMode: isUpgrade
                                    ? ProrationMode.upgrade
                                    : null,
                              );
                            } else {
                              await crosspay.purchase(
                                entitlement,
                                externalStore: ExternalStore.gocardless,
                                redirectUrl: "https://example.com/success",
                                failureRedirectUrl:
                                    "https://example.com/failure",
                                proratedProduct: isUpgrade
                                    ? basicEntitlement.products.gocardless
                                    : null,
                                prorationMode: isUpgrade
                                    ? ProrationMode.upgrade
                                    : null,
                              );
                            }
                          } else {
                            await crosspay.purchase(
                              entitlement,
                              externalStore: ExternalStore.stripe,
                              redirectUrl: "https://example.com/success",
                              failureRedirectUrl: "https://example.com/failure",
                              proratedProduct: isUpgrade
                                  ? Platform.isAndroid
                                        ? basicEntitlement.products.playStore
                                        : basicEntitlement.products.appStore
                                  : null,
                              prorationMode: isUpgrade
                                  ? ProrationMode.upgrade
                                  : null,
                            );
                          }
                        },
                        child: switch ((
                          isActive,
                          activeSubscription?.renewalStatus,
                          entitlement.entitlementType,
                        )) {
                          (
                            true,
                            SubscriptionRenewalStatus.canceled,
                            EntitlementType.subscription,
                          ) =>
                            Text("Resubscribe"),
                          (true, _, EntitlementType.subscription) => Text(
                            "Manage Subscription",
                          ),
                          (true, _, != EntitlementType.subscription) => Text(
                            "Repurchase",
                          ),
                          (false, _, != EntitlementType.subscription) => Text(
                            "Purchase",
                          ),
                          _ => Text("Subscribe"),
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
