import 'package:flutter/material.dart';

class AppInputDecoration {
  static InputDecoration noOutline({String hintText = ''}) {
    return InputDecoration(
      hintText: hintText,
      contentPadding: const EdgeInsets.all(8),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
      ),
      filled: true,
      fillColor: Colors.blueGrey.withOpacity(.1),
    );
  }
}
