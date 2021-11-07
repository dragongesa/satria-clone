import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satria/app/data/locals/db.dart';
import 'package:satria/app/data/models/local_db/credentials/credential_model.dart';
import 'home_state.dart';
export 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(validate: List.generate(5, (index) => false)));

  tambahKredensial(String layanan, String email, String password) {
    DB.instance.credential.add(Credential(
        userId: DB.instance.currentUserId,
        layanan: layanan,
        email: email,
        password: password));
  }
}
