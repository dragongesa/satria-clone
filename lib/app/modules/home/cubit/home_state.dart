import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState._();
  const factory HomeState({
    @Default([]) List<bool> validate,
  }) = _HomeState;

  double get validatePercent {
    var top = List.from(validate)..retainWhere((element) => element == true);
    var bottom = List.from(validate);
    return top.length / bottom.length;
  }
}
