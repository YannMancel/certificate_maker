import 'package:flutter/foundation.dart' show optionalTypeArgs;
import 'package:freezed_annotation/freezed_annotation.dart'
    show DeepCollectionEquality, JsonKey, freezed;

part 'dialog_state.freezed.dart';

@freezed
class DialogState<T> with _$DialogState<T> {
  const factory DialogState.confirm({T? value}) = _Confirm<T>;
  const factory DialogState.cancel() = _Cancel<T>;
}
