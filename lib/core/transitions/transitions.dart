import 'package:flutter/material.dart';

typedef TransitionsBuilder = Widget Function(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
);

abstract class Transitions {
  static TransitionsBuilder get fadeTransitionsBuilder {
    return (_, animation, __, child) {
      final opacity = animation.drive(
        Tween<double>(begin: 0.0, end: 1.0),
      );

      return FadeTransition(
        opacity: opacity,
        child: child,
      );
    };
  }

  static TransitionsBuilder get scaleTransitionsBuilder {
    return (_, animation, __, child) {
      final scale = animation.drive(
        Tween<double>(begin: 0.0, end: 1.0),
      );

      return ScaleTransition(
        scale: scale,
        child: child,
      );
    };
  }

  static TransitionsBuilder get slideTransitionsBuilder {
    return (_, animation, __, child) {
      // left to right: begin: Offset(-1,0) end: Offset.zero
      // right to left: begin: Offset(1,0) end: Offset.zero
      // bottom to top: begin: Offset(0,1) end: Offset.zero
      // top to bottom: begin: Offset(0,-1) end: Offset.zero
      // from top right corner: begin: Offset(1,-1) end: Offset.zero
      // from bottom right corner: begin: Offset(1,1) end: Offset.zero
      // from top left corner: begin: Offset(-1,-1) end: Offset.zero
      // from bottom left corner: begin: Offset(-1,1) end: Offset.zero

      final position = animation.drive(
        Tween<Offset>(begin: const Offset(-1, 1), end: Offset.zero),
      );

      return SlideTransition(
        position: position,
        child: child,
      );
    };
  }
}
