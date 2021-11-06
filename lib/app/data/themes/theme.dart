import 'package:flutter/material.dart';
import './theme_dark.dart';
import './theme_light.dart';

enum ThemeActive { light, dark }

class AppTheme {
  static final ThemeData light = lightTheme;
  static final ThemeData dark = darkTheme;
}
