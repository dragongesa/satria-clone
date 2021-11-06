import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

const Color primaryTheme1 = Color(0xFFffffff);

ThemeData lightTheme = ThemeData.light().copyWith(
  brightness: Brightness.dark,
  backgroundColor: Colors.white,
  primaryColor: Constants.primaryColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: Constants.primaryColor,
    foregroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
    ),
  ),
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
  }),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
        backgroundColor: Colors.transparent, primary: Constants.primaryColor),
  ),
  primaryTextTheme: GoogleFonts.nunitoSansTextTheme(),
  textTheme: GoogleFonts.nunitoSansTextTheme(),
  colorScheme: const ColorScheme.light(
    onSecondary: Colors.white,
    secondary: Colors.blue,
    primary: Colors.blue,
    onPrimary: Colors.white,
    background: Colors.white,
    onBackground: Color(0xFF333333),
  ),
);
