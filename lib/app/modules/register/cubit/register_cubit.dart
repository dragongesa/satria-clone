import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satria/app/data/locals/db.dart';
import 'package:satria/app/data/models/local_db/user/user_model.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import 'register_state.dart';
export 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit()
      : super(
          RegisterState(
            validate: List.generate(5, (index) => false),
          ),
        );

  Future<int?> registerUser(String name, String email, String password) async {
    bool isEmailExist = DB.instance.user.values
            .toList()
            .indexWhere((element) => element.email == email) !=
        -1;
    if (isEmailExist) {
      return null;
    }
    return await DB.instance.user
        .add(User(name: name, email: email, password: password));
  }

  updateValidator(String? p0) {
    bool isUppercaseExist = false;
    bool isLowercaseExist = false;
    bool isNumExist = false;
    bool isGajelasExist = false;
    bool isLengthJoss = false;
    if (p0 != null && p0.isNotEmpty) {
      isUppercaseExist = Validators.patternRegExp(
              RegExp(r"(?=.*[A-Z])\w+"), 'Harus punya 1 huruf kapital')(p0) ==
          null;
      isLowercaseExist = Validators.patternRegExp(
              RegExp(r"(?=.*[a-z])\w+"), 'Harus punya 1 huruf kapital')(p0) ==
          null;
      isNumExist = Validators.patternRegExp(
              RegExp(r"(?=.*[0-9])\w+"), 'Harus punya 1 huruf kapital')(p0) ==
          null;
      isGajelasExist = Validators.patternRegExp(RegExp(r"(?=.*?[!@#%\$&*~])"),
              'Harus punya 1 huruf kapital')(p0) ==
          null;
      isLengthJoss = Validators.minLength(8, 'min 8')(p0) == null;
    }
    emit(state.copyWith(validate: [
      isUppercaseExist,
      isLowercaseExist,
      isNumExist,
      isGajelasExist,
      isLengthJoss
    ]));
  }

  checkField(String name, String email) async {
    bool _isAllFilled =
        name.isNotEmpty && email.isNotEmpty && state.validatePercent == 1;
    emit(state.copyWith(
      isAllFilled: _isAllFilled,
    ));
  }
}
