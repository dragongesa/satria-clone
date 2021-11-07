import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final int? maxLines;
  final String? hintText;
  final Color? fillColor;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final bool enabled;
  final bool readOnly;
  final bool? obscureText;
  final String? initialValue;
  final Function()? onTap;
  const CustomTextField(
      {Key? key,
      this.maxLines,
      this.hintText,
      this.obscureText,
      this.initialValue,
      this.validator,
      this.readOnly = false,
      this.controller,
      this.onTap,
      this.fillColor,
      this.textInputType = TextInputType.text,
      this.inputFormatters,
      this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      obscureText: obscureText ?? false,
      initialValue: initialValue,
      validator: validator,
      controller: controller,
      enabled: enabled,
      readOnly: readOnly,
      autovalidateMode: AutovalidateMode.always,
      onTap: onTap,
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      textAlign: textInputType == TextInputType.number
          ? TextAlign.right
          : TextAlign.left,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        filled: true,
        fillColor: fillColor ?? Theme.of(context).scaffoldBackgroundColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(.2),
          ),
        ),
      ),
    );
  }
}

dismissKeyboard(BuildContext context) async {
  await Future.delayed(const Duration(milliseconds: 200))
      .then((value) => FocusScope.of(context).unfocus());
}
