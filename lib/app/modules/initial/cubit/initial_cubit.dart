import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satria/app/data/locals/db.dart';
import 'package:satria/app/data/models/local_db/auth/auth_model.dart';
import 'package:satria/app/data/models/local_db/user/user_model.dart';
import 'package:local_auth/local_auth.dart';
import 'initial_state.dart';
export 'initial_state.dart';

class InitialCubit extends Cubit<InitialState> {
  InitialCubit(InitialState initialState) : super(initialState);

  Future checkCredentials() async {
    try {
      List<Auth> authList = DB.instance.auth.values.toList();
      Auth? auth = authList.isEmpty ? null : authList.first;
      List<User> users = DB.instance.user.values.toList();
      emit(state.copyWith(
          isLoggedIn: auth?.isLoggedIn ?? false,
          isNeedRegister: users.isEmpty));
      log(state.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  checkBiometrics() async {
    List<Auth> authList = DB.instance.auth.values.toList();
    Auth? auth = authList.isEmpty ? null : authList.first;
    List<User> users = DB.instance.user.values.toList();
    var localAuth = LocalAuthentication();
    bool canCheckBiometrics = await localAuth.canCheckBiometrics;
    if (canCheckBiometrics) {
      bool didAuthenticate = await localAuth.authenticate(
        localizedReason: 'Please authenticate to login automatically',
        biometricOnly: true,
        useErrorDialogs: false,
      );
      if (didAuthenticate) {
        DB.instance.auth.putAt(0, auth!.copyWith(isLoggedIn: true));
        emit(state.copyWith(isLoggedIn: true, isNeedRegister: users.isEmpty));
      } else {
        emit(state.copyWith(isLoggedIn: false, isNeedRegister: users.isEmpty));
      }
    }
  }

  cheekkk() {
    emit(state.copyWith(isLoggedIn: !state.isLoggedIn));
  }
}
