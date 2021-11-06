import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satria/app/data/locals/db.dart';
import 'package:satria/app/data/models/local_db/auth/auth_model.dart';
import 'package:satria/app/data/models/local_db/user/user_model.dart';

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
    } catch (e) {
      log(e.toString());
    }
  }

  cheekkk() {
    emit(state.copyWith(isLoggedIn: !state.isLoggedIn));
  }
}
