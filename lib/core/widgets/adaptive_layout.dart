import 'package:certificate_maker/_features.dart';
import 'package:flutter/material.dart';

typedef AdaptiveBuilder = Widget Function(BuildContext, ScreenSize);

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.builder,
  });

  final AdaptiveBuilder builder;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenSize = ScreenSize.fromSize(size);
    return builder(context, screenSize);
  }
}
