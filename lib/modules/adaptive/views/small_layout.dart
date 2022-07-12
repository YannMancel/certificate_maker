import 'package:flutter/material.dart';

// TODO(YannMancel): implement this layout
class SmallLayout extends StatelessWidget {
  const SmallLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: const Text('SMALL'),
      ),
    );
  }
}
