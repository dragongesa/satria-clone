import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:satria/app/data/locals/db.dart';
import 'package:satria/app/data/models/local_db/auth/auth_model.dart';
import 'package:satria/app/data/shared/widget/custom_text_field.dart';
import 'package:satria/app/data/shared/widget/labelfield.dart';
import 'package:satria/app/data/utils/toast_function.dart';
import 'package:satria/app/modules/initial/cubit/initial_cubit.dart';
import 'package:satria/app/modules/login/cubit/login_cubit.dart';
import 'package:satria/routes/routes.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  static const platform = MethodChannel('dev.itpelajar.com/satria');
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
    print(_batteryLevel);
  }

  final imgUrl =
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/3e50fc94-a1de-4734-b30c-23be84b8b0b5/db47x3w-d325c067-a1b9-43d6-b00a-b103a2e1a2da.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzNlNTBmYzk0LWExZGUtNDczNC1iMzBjLTIzYmU4NGI4YjBiNVwvZGI0N3gzdy1kMzI1YzA2Ny1hMWI5LTQzZDYtYjAwYS1iMTAzYTJlMWEyZGEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.maAoLrCUvREjnNTz1D-XZz8fOJ1_ofCgtKn3OtY33YU';
  Timer? debounce;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: GestureDetector(
                      onTap: () {
                        _getBatteryLevel();
                      },
                      child: Image.network(
                        imgUrl,
                        height: 120,
                      ),
                    ),
                  ),
                ),
              ),
              Builder(builder: (context) {
                return Form(
                  onChanged: () {
                    if (debounce != null) {
                      debounce!.cancel();
                    }
                    debounce = Timer(Duration(milliseconds: 200), () {});
                  },
                  child: SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          LabelField(
                            label: 'Email/Username',
                            field: CustomTextField(
                              validator:
                                  Validators.email('Ga bener tuh emailnya'),
                              controller: emailController,
                            ),
                          ),
                          BlocBuilder<LoginCubit, LoginState>(
                            builder: (context, state) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  LabelField(
                                    label: 'Password',
                                    field: CustomTextField(
                                      controller: passwordController,
                                      validator: (p0) {},
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16),
                            width: double.infinity,
                            height: 46,
                            child: BlocBuilder<LoginCubit, LoginState>(
                              builder: (context, state) {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  onPressed: () async {
                                    bool res = await context
                                        .read<LoginCubit>()
                                        .login(emailController.text,
                                            passwordController.text);
                                    if (res) {
                                      TToast.success('Selamat datang!');
                                      context
                                          .read<InitialCubit>()
                                          .checkCredentials();
                                    } else {
                                      TToast.error(
                                          'Username atau password salah!');
                                    }
                                  },
                                  child: Text('Masuk'),
                                );
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16),
                            width: double.infinity,
                            height: 46,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                elevation: 0,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () async {
                                Navigator.pushReplacementNamed(
                                    context, Routes.REGISTER);
                              },
                              child: Text('Tambah akun'),
                            ),
                          ),
                          SizedBox(height: 32),
                          ValueListenableBuilder<Box<Auth>>(
                            valueListenable: DB.instance.auth.listenable(),
                            builder: (context, value, child) => value.isEmpty ||
                                    value.getAt(0)?.userData == null
                                ? SizedBox()
                                : Center(
                                    child: IconButton(
                                        iconSize: 64,
                                        onPressed: () {
                                          context
                                              .read<InitialCubit>()
                                              .checkBiometrics();
                                        },
                                        icon: Icon(Icons.fingerprint)),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
