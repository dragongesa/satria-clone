import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satria/app/data/locals/db.dart';
import 'package:satria/app/data/models/local_db/auth/auth_model.dart';
import 'package:satria/app/data/models/local_db/user/user_model.dart';

import 'login_state.dart';
export 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  Future<bool> login(String email, String password) async {
    bool isSuccess = false;
    try {
      final User user = DB.instance.user.values.firstWhere(
          (element) => element.email == email && element.password == password);
      if (DB.instance.auth.isEmpty) {
        DB.instance.auth.add(Auth(isLoggedIn: true, userData: user));
      } else {
        DB.instance.auth.putAt(0, Auth(isLoggedIn: true, userData: user));
      }
      isSuccess = true;
    } catch (e) {
      log('$e');
      if (DB.instance.auth.values.isNotEmpty) {
        DB.instance.auth.putAt(0, Auth(isLoggedIn: false));
      } else {
        DB.instance.auth.add(Auth(isLoggedIn: false));
      }
    }
    return isSuccess;
  }
}
