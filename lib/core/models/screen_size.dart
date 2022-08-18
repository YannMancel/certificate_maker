import 'package:certificate_maker/_features.dart';
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
    if (size.width > kLargeWidth) return const ScreenSize.large();
    if (size.width > kMediumWidth) return const ScreenSize.medium();
    return const ScreenSize.small();
  }
}
