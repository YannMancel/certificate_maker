import 'package:flutter/material.dart' show Size, optionalTypeArgs;
import 'package:freezed_annotation/freezed_annotation.dart' show freezed;

part 'screen_size.freezed.dart';

@freezed
class ScreenSize with _$ScreenSize {
  const ScreenSize._();

  const factory ScreenSize.small() = _Small;
  const factory ScreenSize.medium() = _Medium;
  const factory ScreenSize.large() = _Large;

  factory ScreenSize.fromSize(Size size) {
    if (size.width > 1024.0) return const ScreenSize.large();
    if (size.width > 332.0) return const ScreenSize.medium();
    return const ScreenSize.small();
  }
}
