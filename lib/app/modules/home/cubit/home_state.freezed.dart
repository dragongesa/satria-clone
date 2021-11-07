// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  _HomeState call({List<bool> validate = const []}) {
    return _HomeState(
      validate: validate,
    );
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  List<bool> get validate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call({List<bool> validate});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? validate = freezed,
  }) {
    return _then(_value.copyWith(
      validate: validate == freezed
          ? _value.validate
          : validate // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ));
  }
}

/// @nodoc
abstract class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) then) =
      __$HomeStateCopyWithImpl<$Res>;
  @override
  $Res call({List<bool> validate});
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(_HomeState _value, $Res Function(_HomeState) _then)
      : super(_value, (v) => _then(v as _HomeState));

  @override
  _HomeState get _value => super._value as _HomeState;

  @override
  $Res call({
    Object? validate = freezed,
  }) {
    return _then(_HomeState(
      validate: validate == freezed
          ? _value.validate
          : validate // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ));
  }
}

/// @nodoc

class _$_HomeState extends _HomeState {
  const _$_HomeState({this.validate = const []}) : super._();

  @JsonKey(defaultValue: const [])
  @override
  final List<bool> validate;

  @override
  String toString() {
    return 'HomeState(validate: $validate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeState &&
            const DeepCollectionEquality().equals(other.validate, validate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(validate));

  @JsonKey(ignore: true)
  @override
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);
}

abstract class _HomeState extends HomeState {
  const factory _HomeState({List<bool> validate}) = _$_HomeState;
  const _HomeState._() : super._();

  @override
  List<bool> get validate;
  @override
  @JsonKey(ignore: true)
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
