import 'package:flutter/material.dart';

// TODO(YannMancel): implement this layout
class MediumLayout extends StatelessWidget {
  const MediumLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.green,
        alignment: Alignment.center,
        child: const Text('MEDIUM'),
      ),
    );
  }
}
