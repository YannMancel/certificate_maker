import 'package:flutter/foundation.dart' show optionalTypeArgs;
import 'package:freezed_annotation/freezed_annotation.dart'
    show DeepCollectionEquality, JsonKey, freezed;

part 'certificate.freezed.dart';

@freezed
class Certificate with _$Certificate {
  const factory Certificate.judge({
    required int id,
    required String firstName,
    required String lastName,
    required String country,
  }) = _Judge;

  const factory Certificate.ranking({
    required int id,
    required String rank,
    required String discipline,
    required String event,
    required String kettlebell,
    required String weightGroup,
    required String ageGroup,
    required String firstName,
    required String lastName,
    required String country,
  }) = _Ranking;
}
