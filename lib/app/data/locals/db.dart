import 'package:hive_flutter/hive_flutter.dart';
import 'package:satria/app/data/models/local_db/auth/auth_model.dart';
import 'package:satria/app/data/models/local_db/credentials/credential_model.dart';
import 'package:satria/app/data/models/local_db/user/user_model.dart';

class DB {
  final user = Hive.box<User>('user');
  final credential = Hive.box<Credential>('credential');
  final auth = Hive.box<Auth>('auth');
  static DB instance = DB();

  int get currentUserId {
    return DB.instance.user.keyAt(
        user.values.toList().indexOf(DB.instance.auth.getAt(0)!.userData!));
  }
}
