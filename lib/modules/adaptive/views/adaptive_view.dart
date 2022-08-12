import 'package:certificate_maker/_features.dart';
import 'package:flutter/material.dart';

class AdaptiveView extends StatelessWidget {
  const AdaptiveView({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      builder: (_, screenSize) => screenSize.when<Widget>(
        small: () => SmallLayout(child: child),
        medium: () => MediumLayout(child: child),
        large: () => LargeLayout(child: child),
      ),
    );
  }
}
