// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthTearOff {
  const _$AuthTearOff();

  _Auth call(
      {@HiveField(0) dynamic isLoggedIn = false,
      @HiveField(1) User? userData}) {
    return _Auth(
      isLoggedIn: isLoggedIn,
      userData: userData,
    );
  }
}

/// @nodoc
const $Auth = _$AuthTearOff();

/// @nodoc
mixin _$Auth {
  @HiveField(0)
  dynamic get isLoggedIn => throw _privateConstructorUsedError;
  @HiveField(1)
  User? get userData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthCopyWith<Auth> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthCopyWith<$Res> {
  factory $AuthCopyWith(Auth value, $Res Function(Auth) then) =
      _$AuthCopyWithImpl<$Res>;
  $Res call({@HiveField(0) dynamic isLoggedIn, @HiveField(1) User? userData});

  $UserCopyWith<$Res>? get userData;
}

/// @nodoc
class _$AuthCopyWithImpl<$Res> implements $AuthCopyWith<$Res> {
  _$AuthCopyWithImpl(this._value, this._then);

  final Auth _value;
  // ignore: unused_field
  final $Res Function(Auth) _then;

  @override
  $Res call({
    Object? isLoggedIn = freezed,
    Object? userData = freezed,
  }) {
    return _then(_value.copyWith(
      isLoggedIn: isLoggedIn == freezed
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userData: userData == freezed
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get userData {
    if (_value.userData == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.userData!, (value) {
      return _then(_value.copyWith(userData: value));
    });
  }
}

/// @nodoc
abstract class _$AuthCopyWith<$Res> implements $AuthCopyWith<$Res> {
  factory _$AuthCopyWith(_Auth value, $Res Function(_Auth) then) =
      __$AuthCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) dynamic isLoggedIn, @HiveField(1) User? userData});

  @override
  $UserCopyWith<$Res>? get userData;
}

/// @nodoc
class __$AuthCopyWithImpl<$Res> extends _$AuthCopyWithImpl<$Res>
    implements _$AuthCopyWith<$Res> {
  __$AuthCopyWithImpl(_Auth _value, $Res Function(_Auth) _then)
      : super(_value, (v) => _then(v as _Auth));

  @override
  _Auth get _value => super._value as _Auth;

  @override
  $Res call({
    Object? isLoggedIn = freezed,
    Object? userData = freezed,
  }) {
    return _then(_Auth(
      isLoggedIn: isLoggedIn == freezed ? _value.isLoggedIn : isLoggedIn,
      userData: userData == freezed
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 2)
class _$_Auth implements _Auth {
  const _$_Auth(
      {@HiveField(0) this.isLoggedIn = false, @HiveField(1) this.userData});

  @JsonKey(defaultValue: false)
  @override
  @HiveField(0)
  final dynamic isLoggedIn;
  @override
  @HiveField(1)
  final User? userData;

  @override
  String toString() {
    return 'Auth(isLoggedIn: $isLoggedIn, userData: $userData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Auth &&
            const DeepCollectionEquality()
                .equals(other.isLoggedIn, isLoggedIn) &&
            (identical(other.userData, userData) ||
                other.userData == userData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(isLoggedIn), userData);

  @JsonKey(ignore: true)
  @override
  _$AuthCopyWith<_Auth> get copyWith =>
      __$AuthCopyWithImpl<_Auth>(this, _$identity);
}

abstract class _Auth implements Auth {
  const factory _Auth(
      {@HiveField(0) dynamic isLoggedIn,
      @HiveField(1) User? userData}) = _$_Auth;

  @override
  @HiveField(0)
  dynamic get isLoggedIn;
  @override
  @HiveField(1)
  User? get userData;
  @override
  @JsonKey(ignore: true)
  _$AuthCopyWith<_Auth> get copyWith => throw _privateConstructorUsedError;
}
