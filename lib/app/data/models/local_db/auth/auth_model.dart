import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:satria/app/data/models/local_db/user/user_model.dart';
part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class Auth with _$Auth {
  @HiveType(typeId: 2)
  const factory Auth({
    @Default(false) @HiveField(0) isLoggedIn,
    @HiveField(1) User? userData,
  }) = _Auth;
}
