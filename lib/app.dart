import 'package:certificate_maker/_features.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'
    show ProviderObserver, ProviderScope;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      observers: kDebugMode ? const <ProviderObserver>[AppObserver()] : null,
      child: DeferredSetup(
        asyncBuilder: (_) async {
          return MaterialApp(
            title: kAppName,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.blue),
            home: const AdaptiveView(),
          );
        },
      ),
    );
  }
}
