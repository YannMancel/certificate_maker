import 'package:certificate_maker/_features.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  double get _factor => 0.7;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));

    return Stack(
      children: <Widget>[
        Center(
          child: FractionallySizedBox(
            widthFactor: _factor,
            heightFactor: _factor,
            child: Assets.images.ikmfLogoLabels.image(),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton(
              onPressed: () => PreviewView.go(context),
              child: const Icon(Icons.add),
            ),
          ),
        )
      ],
    );
  }
}
