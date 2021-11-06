import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'credential_model.freezed.dart';
part 'credential_model.g.dart';

@freezed
class Credential with _$Credential {
  @HiveType(typeId: 1)
  const factory Credential({
    @HiveField(0) required int userId,
    @HiveField(1) required String layanan,
    @HiveField(2) required String email,
    @HiveField(3) required String password,
  }) = _Credential;

  factory Credential.fromJson(Map<String, dynamic> json) =>
      _$CredentialFromJson(json);
}
