import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const RegisterState._();
  const factory RegisterState({
    @Default([]) List<bool> validate,
  }) = _RegisterState;

  double get validatePercent {
    var top = List.from(validate)..retainWhere((element) => element == true);
    var bottom = List.from(validate);
    return top.length / bottom.length;
  }
}
