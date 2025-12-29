import 'dart:convert';

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

  @override
  void initState() {
    crosspay = FlutterCrosspay(
      publicKey: Env.crosspayPublicKey,
      environment: CrosspayEnvironment.sandbox,
      baseUrl: Env.crosspayApiUrl,
    )..identify("predrag.cvetkovski@maxint.com");

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final entitlements = await crosspay.listEntitlements(ExternalStore.stripe);

      debugPrint("Entitlements: ${jsonEncode(entitlements)}");

      final products = await crosspay.queryProducts(ExternalStore.stripe);

      debugPrint("Products: ${jsonEncode(products)}");

      final activeSubscription = await crosspay.activeEntitlement(ExternalStore.stripe);

      debugPrint("Active Subscription: ${jsonEncode(activeSubscription)}");
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
