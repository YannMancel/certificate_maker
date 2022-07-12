import 'package:certificate_maker/_features.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  double get _factor => 0.7;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));

    return Center(
      child: FractionallySizedBox(
        widthFactor: _factor,
        heightFactor: _factor,
        child: Assets.images.ikmfLogoLabels.image(),
      ),
    );
  }
}
