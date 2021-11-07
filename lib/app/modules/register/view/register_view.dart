import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:satria/app/data/shared/widget/custom_text_field.dart';
import 'package:satria/app/data/shared/widget/labelfield.dart';
import 'package:satria/app/data/utils/assets.dart';
import 'package:satria/app/data/utils/toast_function.dart';
import 'package:satria/app/modules/initial/cubit/initial_cubit.dart';
import 'package:satria/app/modules/register/cubit/register_cubit.dart';
import 'package:satria/routes/routes.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final imgUrl =
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/3e50fc94-a1de-4734-b30c-23be84b8b0b5/db47x3w-d325c067-a1b9-43d6-b00a-b103a2e1a2da.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzNlNTBmYzk0LWExZGUtNDczNC1iMzBjLTIzYmU4NGI4YjBiNVwvZGI0N3gzdy1kMzI1YzA2Ny1hMWI5LTQzZDYtYjAwYS1iMTAzYTJlMWEyZGEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.maAoLrCUvREjnNTz1D-XZz8fOJ1_ofCgtKn3OtY33YU';
  Timer? debounce;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
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
                      context.read<InitialCubit>().checkCredentials();
                    },
                    child: Image.network(
                      imgUrl,
                      height: 120,
                    ),
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    return Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.always,
                      onChanged: () {
                        if (debounce != null) {
                          debounce!.cancel();
                        }
                        debounce = Timer(Duration(milliseconds: 200), () {
                          context.read<RegisterCubit>().checkField(
                              nameController.text, emailController.text);
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          LabelField(
                            label: 'Name',
                            field: CustomTextField(
                              controller: nameController,
                            ),
                          ),
                          LabelField(
                            label: 'Email/Username',
                            field: CustomTextField(
                              validator:
                                  Validators.email('Ga bener tuh emailnya'),
                              controller: emailController,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Ingatlah password utama ini, jika anda lupa maka anda tidak bisa mengakses semua data password yang tersimpan dalam aplikasi ini',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              LabelField(
                                label: 'Password',
                                field: CustomTextField(
                                  controller: passwordController,
                                  validator: (p0) {
                                    context
                                        .read<RegisterCubit>()
                                        .updateValidator(p0);
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: IconTheme(
                                  data: IconThemeData(
                                    size: 14,
                                    color: Colors.grey.shade300,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        FontAwesome5Solid.caret_square_up,
                                        color: state.validate[0]
                                            ? Colors.green
                                            : null,
                                      ),
                                      Icon(
                                        FontAwesome5Solid.caret_square_down,
                                        color: state.validate[1]
                                            ? Colors.green
                                            : null,
                                      ),
                                      Icon(
                                        FontAwesome5Solid.sort_numeric_up,
                                        color: state.validate[2]
                                            ? Colors.green
                                            : null,
                                      ),
                                      Icon(
                                        FontAwesome5Solid.percentage,
                                        color: state.validate[3]
                                            ? Colors.green
                                            : null,
                                      ),
                                      Icon(
                                        FontAwesome5Solid.long_arrow_alt_right,
                                        color: state.validate[4]
                                            ? Colors.green
                                            : null,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: double.infinity,
                                  child: LinearProgressIndicator(
                                    backgroundColor: Colors.grey.shade200,
                                    valueColor: AlwaysStoppedAnimation(
                                        state.validatePercent < .5
                                            ? Colors.red
                                            : state.validatePercent != 1
                                                ? Colors.amber
                                                : Colors.green),
                                    value: state.validatePercent,
                                  )),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16),
                            width: double.infinity,
                            height: 46,
                            child: BlocBuilder<RegisterCubit, RegisterState>(
                              builder: (context, state) {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  onPressed: !state.isAllFilled
                                      ? null
                                      : () async {
                                          if (formKey.currentState!
                                              .validate()) {
                                            int? idUser = await context
                                                .read<RegisterCubit>()
                                                .registerUser(
                                                    nameController.text,
                                                    emailController.text,
                                                    passwordController.text);
                                            if (idUser != null) {
                                              TToast.success(
                                                  'Pendaftaran sukses');
                                              context
                                                  .read<InitialCubit>()
                                                  .checkCredentials();
                                              Future.delayed(Duration(
                                                      milliseconds: 200))
                                                  .then((value) async {
                                                nameController.text = '';
                                                emailController.text = '';
                                                passwordController.text = '';
                                                bool? navigateToLogin =
                                                    await showDialog(
                                                        context: context,
                                                        barrierColor:
                                                            Colors.greenAccent,
                                                        builder:
                                                            (context) =>
                                                                AlertDialog(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .green,
                                                                  content:
                                                                      Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Lottie
                                                                          .asset(
                                                                        Assets
                                                                            .lottieRegisterSuccess,
                                                                        animate:
                                                                            true,
                                                                        height:
                                                                            200,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child:
                                                                            Text(
                                                                          'Mantap!',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        'Akunmu sudah terdaftar secara lokal diperangkat ini!',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                16),
                                                                        width: double
                                                                            .infinity,
                                                                        child: ElevatedButton(
                                                                            style: ElevatedButton.styleFrom(
                                                                              elevation: 0,
                                                                              primary: Colors.white,
                                                                              onPrimary: Colors.green,
                                                                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                            ),
                                                                            onPressed: () {
                                                                              Navigator.pop(context, true);
                                                                            },
                                                                            child: Text('Masuk sekarang')),
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                16),
                                                                        width: double
                                                                            .infinity,
                                                                        child: OutlinedButton(
                                                                            style: ElevatedButton.styleFrom(
                                                                              elevation: 0,
                                                                              side: BorderSide(
                                                                                color: Colors.white,
                                                                                width: .5,
                                                                              ),
                                                                              onPrimary: Colors.white,
                                                                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                            ),
                                                                            onPressed: () {
                                                                              Navigator.pop(context, false);
                                                                            },
                                                                            child: Text('Pengen disini aja')),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ));
                                                if (navigateToLogin == true) {
                                                  Navigator
                                                      .pushReplacementNamed(
                                                          context,
                                                          Routes.LOGIN);
                                                }
                                              });
                                            } else {
                                              TToast.general(
                                                  'Email sudah digunakan!');
                                            }
                                          } else {
                                            TToast.error(
                                                'Email gak valid masih aja ngebet daftar');
                                          }
                                        },
                                  child: Text('Daftar'),
                                );
                              },
                            ),
                          ),
                          if (context
                                  .read<InitialCubit>()
                                  .state
                                  .isNeedRegister ==
                              false)
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              width: double.infinity,
                              height: 46,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    textStyle: TextStyle(
                                  fontSize: 12,
                                )),
                                child: Text('Sudah punya akun? Login-lah'),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, Routes.LOGIN);
                                },
                              ),
                            )
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
