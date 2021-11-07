// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RegisterStateTearOff {
  const _$RegisterStateTearOff();

  _RegisterState call(
      {List<bool> validate = const [], bool isAllFilled = false}) {
    return _RegisterState(
      validate: validate,
      isAllFilled: isAllFilled,
    );
  }
}

/// @nodoc
const $RegisterState = _$RegisterStateTearOff();

/// @nodoc
mixin _$RegisterState {
  List<bool> get validate => throw _privateConstructorUsedError;
  bool get isAllFilled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res>;
  $Res call({List<bool> validate, bool isAllFilled});
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  final RegisterState _value;
  // ignore: unused_field
  final $Res Function(RegisterState) _then;

  @override
  $Res call({
    Object? validate = freezed,
    Object? isAllFilled = freezed,
  }) {
    return _then(_value.copyWith(
      validate: validate == freezed
          ? _value.validate
          : validate // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      isAllFilled: isAllFilled == freezed
          ? _value.isAllFilled
          : isAllFilled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$RegisterStateCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterStateCopyWith(
          _RegisterState value, $Res Function(_RegisterState) then) =
      __$RegisterStateCopyWithImpl<$Res>;
  @override
  $Res call({List<bool> validate, bool isAllFilled});
}

/// @nodoc
class __$RegisterStateCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res>
    implements _$RegisterStateCopyWith<$Res> {
  __$RegisterStateCopyWithImpl(
      _RegisterState _value, $Res Function(_RegisterState) _then)
      : super(_value, (v) => _then(v as _RegisterState));

  @override
  _RegisterState get _value => super._value as _RegisterState;

  @override
  $Res call({
    Object? validate = freezed,
    Object? isAllFilled = freezed,
  }) {
    return _then(_RegisterState(
      validate: validate == freezed
          ? _value.validate
          : validate // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      isAllFilled: isAllFilled == freezed
          ? _value.isAllFilled
          : isAllFilled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RegisterState extends _RegisterState {
  const _$_RegisterState({this.validate = const [], this.isAllFilled = false})
      : super._();

  @JsonKey(defaultValue: const [])
  @override
  final List<bool> validate;
  @JsonKey(defaultValue: false)
  @override
  final bool isAllFilled;

  @override
  String toString() {
    return 'RegisterState(validate: $validate, isAllFilled: $isAllFilled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterState &&
            const DeepCollectionEquality().equals(other.validate, validate) &&
            (identical(other.isAllFilled, isAllFilled) ||
                other.isAllFilled == isAllFilled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(validate), isAllFilled);

  @JsonKey(ignore: true)
  @override
  _$RegisterStateCopyWith<_RegisterState> get copyWith =>
      __$RegisterStateCopyWithImpl<_RegisterState>(this, _$identity);
}

abstract class _RegisterState extends RegisterState {
  const factory _RegisterState({List<bool> validate, bool isAllFilled}) =
      _$_RegisterState;
  const _RegisterState._() : super._();

  @override
  List<bool> get validate;
  @override
  bool get isAllFilled;
  @override
  @JsonKey(ignore: true)
  _$RegisterStateCopyWith<_RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}
