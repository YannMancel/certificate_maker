import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));

    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
