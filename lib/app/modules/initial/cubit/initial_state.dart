import 'package:freezed_annotation/freezed_annotation.dart';
part 'initial_state.freezed.dart';

@freezed
class InitialState with _$InitialState {
  const factory InitialState({
    @Default(false) bool isLoggedIn,
    @Default(true) bool isNeedRegister,
  }) = _InitialState;
}
