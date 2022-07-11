// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dialog_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DialogState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? value) confirm,
    required TResult Function() cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T? value)? confirm,
    TResult Function()? cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? value)? confirm,
    TResult Function()? cancel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Confirm<T> value) confirm,
    required TResult Function(_Cancel<T> value) cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Confirm<T> value)? confirm,
    TResult Function(_Cancel<T> value)? cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Confirm<T> value)? confirm,
    TResult Function(_Cancel<T> value)? cancel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DialogStateCopyWith<T, $Res> {
  factory $DialogStateCopyWith(
          DialogState<T> value, $Res Function(DialogState<T>) then) =
      _$DialogStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$DialogStateCopyWithImpl<T, $Res>
    implements $DialogStateCopyWith<T, $Res> {
  _$DialogStateCopyWithImpl(this._value, this._then);

  final DialogState<T> _value;
  // ignore: unused_field
  final $Res Function(DialogState<T>) _then;
}

/// @nodoc
abstract class _$$_ConfirmCopyWith<T, $Res> {
  factory _$$_ConfirmCopyWith(
          _$_Confirm<T> value, $Res Function(_$_Confirm<T>) then) =
      __$$_ConfirmCopyWithImpl<T, $Res>;
  $Res call({T? value});
}

/// @nodoc
class __$$_ConfirmCopyWithImpl<T, $Res>
    extends _$DialogStateCopyWithImpl<T, $Res>
    implements _$$_ConfirmCopyWith<T, $Res> {
  __$$_ConfirmCopyWithImpl(
      _$_Confirm<T> _value, $Res Function(_$_Confirm<T>) _then)
      : super(_value, (v) => _then(v as _$_Confirm<T>));

  @override
  _$_Confirm<T> get _value => super._value as _$_Confirm<T>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$_Confirm<T>(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$_Confirm<T> implements _Confirm<T> {
  const _$_Confirm({this.value});

  @override
  final T? value;

  @override
  String toString() {
    return 'DialogState<$T>.confirm(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Confirm<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_ConfirmCopyWith<T, _$_Confirm<T>> get copyWith =>
      __$$_ConfirmCopyWithImpl<T, _$_Confirm<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? value) confirm,
    required TResult Function() cancel,
  }) {
    return confirm(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T? value)? confirm,
    TResult Function()? cancel,
  }) {
    return confirm?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? value)? confirm,
    TResult Function()? cancel,
    required TResult orElse(),
  }) {
    if (confirm != null) {
      return confirm(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Confirm<T> value) confirm,
    required TResult Function(_Cancel<T> value) cancel,
  }) {
    return confirm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Confirm<T> value)? confirm,
    TResult Function(_Cancel<T> value)? cancel,
  }) {
    return confirm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Confirm<T> value)? confirm,
    TResult Function(_Cancel<T> value)? cancel,
    required TResult orElse(),
  }) {
    if (confirm != null) {
      return confirm(this);
    }
    return orElse();
  }
}

abstract class _Confirm<T> implements DialogState<T> {
  const factory _Confirm({final T? value}) = _$_Confirm<T>;

  T? get value;
  @JsonKey(ignore: true)
  _$$_ConfirmCopyWith<T, _$_Confirm<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CancelCopyWith<T, $Res> {
  factory _$$_CancelCopyWith(
          _$_Cancel<T> value, $Res Function(_$_Cancel<T>) then) =
      __$$_CancelCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_CancelCopyWithImpl<T, $Res>
    extends _$DialogStateCopyWithImpl<T, $Res>
    implements _$$_CancelCopyWith<T, $Res> {
  __$$_CancelCopyWithImpl(
      _$_Cancel<T> _value, $Res Function(_$_Cancel<T>) _then)
      : super(_value, (v) => _then(v as _$_Cancel<T>));

  @override
  _$_Cancel<T> get _value => super._value as _$_Cancel<T>;
}

/// @nodoc

class _$_Cancel<T> implements _Cancel<T> {
  const _$_Cancel();

  @override
  String toString() {
    return 'DialogState<$T>.cancel()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Cancel<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? value) confirm,
    required TResult Function() cancel,
  }) {
    return cancel();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T? value)? confirm,
    TResult Function()? cancel,
  }) {
    return cancel?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? value)? confirm,
    TResult Function()? cancel,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Confirm<T> value) confirm,
    required TResult Function(_Cancel<T> value) cancel,
  }) {
    return cancel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Confirm<T> value)? confirm,
    TResult Function(_Cancel<T> value)? cancel,
  }) {
    return cancel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Confirm<T> value)? confirm,
    TResult Function(_Cancel<T> value)? cancel,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel(this);
    }
    return orElse();
  }
}

abstract class _Cancel<T> implements DialogState<T> {
  const factory _Cancel() = _$_Cancel<T>;
}
