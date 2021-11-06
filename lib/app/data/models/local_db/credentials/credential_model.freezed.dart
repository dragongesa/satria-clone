// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'credential_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Credential _$CredentialFromJson(Map<String, dynamic> json) {
  return _Credential.fromJson(json);
}

/// @nodoc
class _$CredentialTearOff {
  const _$CredentialTearOff();

  _Credential call(
      {@HiveField(0) required int userId,
      @HiveField(1) required String layanan,
      @HiveField(2) required String email,
      @HiveField(3) required String password}) {
    return _Credential(
      userId: userId,
      layanan: layanan,
      email: email,
      password: password,
    );
  }

  Credential fromJson(Map<String, Object?> json) {
    return Credential.fromJson(json);
  }
}

/// @nodoc
const $Credential = _$CredentialTearOff();

/// @nodoc
mixin _$Credential {
  @HiveField(0)
  int get userId => throw _privateConstructorUsedError;
  @HiveField(1)
  String get layanan => throw _privateConstructorUsedError;
  @HiveField(2)
  String get email => throw _privateConstructorUsedError;
  @HiveField(3)
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CredentialCopyWith<Credential> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CredentialCopyWith<$Res> {
  factory $CredentialCopyWith(
          Credential value, $Res Function(Credential) then) =
      _$CredentialCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int userId,
      @HiveField(1) String layanan,
      @HiveField(2) String email,
      @HiveField(3) String password});
}

/// @nodoc
class _$CredentialCopyWithImpl<$Res> implements $CredentialCopyWith<$Res> {
  _$CredentialCopyWithImpl(this._value, this._then);

  final Credential _value;
  // ignore: unused_field
  final $Res Function(Credential) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? layanan = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      layanan: layanan == freezed
          ? _value.layanan
          : layanan // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CredentialCopyWith<$Res> implements $CredentialCopyWith<$Res> {
  factory _$CredentialCopyWith(
          _Credential value, $Res Function(_Credential) then) =
      __$CredentialCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int userId,
      @HiveField(1) String layanan,
      @HiveField(2) String email,
      @HiveField(3) String password});
}

/// @nodoc
class __$CredentialCopyWithImpl<$Res> extends _$CredentialCopyWithImpl<$Res>
    implements _$CredentialCopyWith<$Res> {
  __$CredentialCopyWithImpl(
      _Credential _value, $Res Function(_Credential) _then)
      : super(_value, (v) => _then(v as _Credential));

  @override
  _Credential get _value => super._value as _Credential;

  @override
  $Res call({
    Object? userId = freezed,
    Object? layanan = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_Credential(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      layanan: layanan == freezed
          ? _value.layanan
          : layanan // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1)
class _$_Credential implements _Credential {
  const _$_Credential(
      {@HiveField(0) required this.userId,
      @HiveField(1) required this.layanan,
      @HiveField(2) required this.email,
      @HiveField(3) required this.password});

  factory _$_Credential.fromJson(Map<String, dynamic> json) =>
      _$$_CredentialFromJson(json);

  @override
  @HiveField(0)
  final int userId;
  @override
  @HiveField(1)
  final String layanan;
  @override
  @HiveField(2)
  final String email;
  @override
  @HiveField(3)
  final String password;

  @override
  String toString() {
    return 'Credential(userId: $userId, layanan: $layanan, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Credential &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.layanan, layanan) || other.layanan == layanan) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, layanan, email, password);

  @JsonKey(ignore: true)
  @override
  _$CredentialCopyWith<_Credential> get copyWith =>
      __$CredentialCopyWithImpl<_Credential>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CredentialToJson(this);
  }
}

abstract class _Credential implements Credential {
  const factory _Credential(
      {@HiveField(0) required int userId,
      @HiveField(1) required String layanan,
      @HiveField(2) required String email,
      @HiveField(3) required String password}) = _$_Credential;

  factory _Credential.fromJson(Map<String, dynamic> json) =
      _$_Credential.fromJson;

  @override
  @HiveField(0)
  int get userId;
  @override
  @HiveField(1)
  String get layanan;
  @override
  @HiveField(2)
  String get email;
  @override
  @HiveField(3)
  String get password;
  @override
  @JsonKey(ignore: true)
  _$CredentialCopyWith<_Credential> get copyWith =>
      throw _privateConstructorUsedError;
}
