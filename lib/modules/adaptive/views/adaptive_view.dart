import 'package:certificate_maker/_features.dart';
import 'package:flutter/material.dart';

class AdaptiveView extends StatelessWidget {
  const AdaptiveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      builder: (_, screenSize) => screenSize.when<Widget>(
        small: () => const HomePage(title: kAppName),
        medium: () => const HomePage(title: kAppName),
        large: () => const HomePage(title: kAppName),
      ),
    );
  }
}
