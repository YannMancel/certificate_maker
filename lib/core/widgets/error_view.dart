import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));

    return const Center(
      child: Text('An error is found.'),
    );
  }
}
