import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:satria/app/data/shared/widget/custom_bottom_sheet.dart';
import 'package:satria/app/data/shared/widget/custom_text_field.dart';
import 'package:satria/app/data/shared/widget/sheet_label_field.dart';
import 'package:satria/app/data/utils/toast_function.dart';
import 'package:satria/app/modules/home/cubit/home_cubit.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:random_password_generator/random_password_generator.dart';

class AddCredentialForm extends StatefulWidget {
  final void Function(String layanan, String email, String password) onTambah;

  const AddCredentialForm({Key? key, required this.onTambah}) : super(key: key);

  @override
  State<AddCredentialForm> createState() => _AddCredentialFormState();
}

class _AddCredentialFormState extends State<AddCredentialForm> {
  late TextEditingController passwordController;
  late TextEditingController layananController;
  late TextEditingController usernameController;
  late ValueNotifier<bool> obscuring;
  List<bool> validate = List.generate(5, (index) => false);

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
    setState(() {
      validate = [
        isUppercaseExist,
        isLowercaseExist,
        isNumExist,
        isGajelasExist,
        isLengthJoss
      ];
    });
  }

  double get validatePercent {
    var top = List.from(validate)..retainWhere((element) => element == true);
    var bottom = List.from(validate);
    return top.length / bottom.length;
  }

  @override
  void initState() {
    obscuring = ValueNotifier<bool>(true);
    layananController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController()..addListener(passwordListener);
    super.initState();
  }

  @override
  void dispose() {
    obscuring.dispose();
    layananController.dispose();
    usernameController.dispose();
    passwordController
      ..dispose()
      ..removeListener(passwordListener);
    super.dispose();
  }

  passwordListener() {
    updateValidator(passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
        popupTitle: 'Tambah kredensial',
        body: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SheetLabelField(
                    label: 'Layanan',
                    field: CustomTextField(
                      controller: layananController,
                    )),
                SheetLabelField(
                    label: 'Username/Email',
                    field: CustomTextField(
                      controller: usernameController,
                    )),
                SheetLabelField(
                    label: 'Password',
                    field: ValueListenableBuilder<bool>(
                      valueListenable: obscuring,
                      builder: (context, value, child) => Stack(
                        children: [
                          CustomTextField(
                            maxLines: 1,
                            obscureText: value,
                            controller: passwordController,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 2),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.white),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Feather.key,
                                          size: 14,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          'generate',
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
                                    ),
                                    onPressed: () {
                                      int? length =
                                          int.tryParse(passwordController.text);
                                      if (length == null) {
                                        TToast.error(
                                            'Ketik panjangnya disamping dulu kk :))))');
                                      } else {
                                        final password =
                                            RandomPasswordGenerator();

                                        passwordController.text =
                                            password.randomPassword(
                                                uppercase: true,
                                                specialChar: true,
                                                letters: true,
                                                numbers: true,
                                                passwordLength:
                                                    length.toDouble());
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    width: 32,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor: Colors.white),
                                      child: Icon(
                                        value ? Feather.eye_off : Feather.eye,
                                        size: 16,
                                        color:
                                            value ? Colors.grey : Colors.blue,
                                      ),
                                      onPressed: () {
                                        obscuring.value = !obscuring.value;
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: IconTheme(
                        data: IconThemeData(
                          size: 14,
                          color: Colors.grey.shade300,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              FontAwesome5Solid.caret_square_up,
                              color: validate[0] ? Colors.green : null,
                            ),
                            Icon(
                              FontAwesome5Solid.caret_square_down,
                              color: validate[1] ? Colors.green : null,
                            ),
                            Icon(
                              FontAwesome5Solid.sort_numeric_up,
                              color: validate[2] ? Colors.green : null,
                            ),
                            Icon(
                              FontAwesome5Solid.percentage,
                              color: validate[3] ? Colors.green : null,
                            ),
                            Icon(
                              FontAwesome5Solid.long_arrow_alt_right,
                              color: validate[4] ? Colors.green : null,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey.shade200,
                          valueColor:
                              AlwaysStoppedAnimation(validatePercent < .5
                                  ? Colors.red
                                  : validatePercent != 1
                                      ? Colors.amber
                                      : Colors.green),
                          value: validatePercent,
                        )),
                  ],
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(elevation: 0),
                    child: Text('Tambah'),
                    onPressed: () {
                      widget.onTambah(layananController.text,
                          usernameController.text, passwordController.text);
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
