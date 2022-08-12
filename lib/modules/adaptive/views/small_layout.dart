import 'package:certificate_maker/_features.dart';
import 'package:flutter/material.dart';

class SmallLayout extends StatelessWidget {
  const SmallLayout({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kAppName),
      ),
      body: child,
    );
  }
}
