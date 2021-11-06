// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'initial_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$InitialStateTearOff {
  const _$InitialStateTearOff();

  _InitialState call({bool isLoggedIn = false, bool isNeedRegister = true}) {
    return _InitialState(
      isLoggedIn: isLoggedIn,
      isNeedRegister: isNeedRegister,
    );
  }
}

/// @nodoc
const $InitialState = _$InitialStateTearOff();

/// @nodoc
mixin _$InitialState {
  bool get isLoggedIn => throw _privateConstructorUsedError;
  bool get isNeedRegister => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InitialStateCopyWith<InitialState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitialStateCopyWith<$Res> {
  factory $InitialStateCopyWith(
          InitialState value, $Res Function(InitialState) then) =
      _$InitialStateCopyWithImpl<$Res>;
  $Res call({bool isLoggedIn, bool isNeedRegister});
}

/// @nodoc
class _$InitialStateCopyWithImpl<$Res> implements $InitialStateCopyWith<$Res> {
  _$InitialStateCopyWithImpl(this._value, this._then);

  final InitialState _value;
  // ignore: unused_field
  final $Res Function(InitialState) _then;

  @override
  $Res call({
    Object? isLoggedIn = freezed,
    Object? isNeedRegister = freezed,
  }) {
    return _then(_value.copyWith(
      isLoggedIn: isLoggedIn == freezed
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      isNeedRegister: isNeedRegister == freezed
          ? _value.isNeedRegister
          : isNeedRegister // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$InitialStateCopyWith<$Res>
    implements $InitialStateCopyWith<$Res> {
  factory _$InitialStateCopyWith(
          _InitialState value, $Res Function(_InitialState) then) =
      __$InitialStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoggedIn, bool isNeedRegister});
}

/// @nodoc
class __$InitialStateCopyWithImpl<$Res> extends _$InitialStateCopyWithImpl<$Res>
    implements _$InitialStateCopyWith<$Res> {
  __$InitialStateCopyWithImpl(
      _InitialState _value, $Res Function(_InitialState) _then)
      : super(_value, (v) => _then(v as _InitialState));

  @override
  _InitialState get _value => super._value as _InitialState;

  @override
  $Res call({
    Object? isLoggedIn = freezed,
    Object? isNeedRegister = freezed,
  }) {
    return _then(_InitialState(
      isLoggedIn: isLoggedIn == freezed
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      isNeedRegister: isNeedRegister == freezed
          ? _value.isNeedRegister
          : isNeedRegister // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_InitialState implements _InitialState {
  const _$_InitialState({this.isLoggedIn = false, this.isNeedRegister = true});

  @JsonKey(defaultValue: false)
  @override
  final bool isLoggedIn;
  @JsonKey(defaultValue: true)
  @override
  final bool isNeedRegister;

  @override
  String toString() {
    return 'InitialState(isLoggedIn: $isLoggedIn, isNeedRegister: $isNeedRegister)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InitialState &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn) &&
            (identical(other.isNeedRegister, isNeedRegister) ||
                other.isNeedRegister == isNeedRegister));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoggedIn, isNeedRegister);

  @JsonKey(ignore: true)
  @override
  _$InitialStateCopyWith<_InitialState> get copyWith =>
      __$InitialStateCopyWithImpl<_InitialState>(this, _$identity);
}

abstract class _InitialState implements InitialState {
  const factory _InitialState({bool isLoggedIn, bool isNeedRegister}) =
      _$_InitialState;

  @override
  bool get isLoggedIn;
  @override
  bool get isNeedRegister;
  @override
  @JsonKey(ignore: true)
  _$InitialStateCopyWith<_InitialState> get copyWith =>
      throw _privateConstructorUsedError;
}
