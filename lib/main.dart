import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:satria/app/data/models/local_db/auth/auth_model.dart';
import 'package:satria/app/data/models/local_db/credentials/credential_model.dart';
import 'package:satria/app/data/models/local_db/user/user_model.dart';
import 'package:satria/app/modules/initial/cubit/initial_cubit.dart';
import 'package:satria/routes/app_pages.dart';

import 'navigation_observer.dart';

void main() {
  init().then((_) => runApp(SatriaApp()));
}

Future init() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(AuthAdapter());
  Hive.registerAdapter(CredentialAdapter());
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  bool isKeyExist = await secureStorage.containsKey(key: 'key');
  if (!isKeyExist) {
    var key = Hive.generateSecureKey();
    await secureStorage.write(key: 'key', value: base64UrlEncode(key));
  }
  var encryptionKey =
      base64Url.decode((await secureStorage.read(key: 'key')) as String);
  log('$encryptionKey', name: 'encryption_key');
  await Hive.openBox<User>('user',
      encryptionCipher: HiveAesCipher(encryptionKey));
  await Hive.openBox<Credential>('credential',
      encryptionCipher: HiveAesCipher(encryptionKey));
  await Hive.openBox<Auth>('auth',
      encryptionCipher: HiveAesCipher(encryptionKey));
}

class SatriaApp extends StatefulWidget {
  const SatriaApp({Key? key}) : super(key: key);

  @override
  State<SatriaApp> createState() => _SatriaAppState();
}

class _SatriaAppState extends State<SatriaApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => InitialCubit(
        InitialState(
          isLoggedIn: false,
          isNeedRegister: false,
        ),
      ),
      child: MaterialApp(
        title: 'Satria',
        navigatorKey: _navigatorKey,
        routes: AppRoutes.routes,
        initialRoute: AppRoutes.INITIAL,
        builder: EasyLoading.init(
          builder: (context, child) {
            return BlocListener<InitialCubit, InitialState>(
              listener: (context, state) {
                log('menglisten');
                if (state.isLoggedIn) {
                  _navigator.pushReplacementNamed(Routes.HOME);
                } else if (state.isNeedRegister) {
                  _navigator.popUntil((route) => route.isFirst);
                  _navigator.pushReplacementNamed(Routes.REGISTER);
                } else {
                  _navigator.popUntil((route) => route.isFirst);
                  _navigator.pushReplacementNamed(Routes.LOGIN);
                }
              },
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 1,
                ),
                child: child!,
              ),
            );
          },
        ),
      ),
    );
  }
}
