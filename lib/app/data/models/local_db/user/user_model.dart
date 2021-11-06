import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  @HiveType(typeId: 0)
  const factory User({
    @Default('') @HiveField(0) String name,
    @Default('') @HiveField(1) String email,
    @Default('') @HiveField(2) String password,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
