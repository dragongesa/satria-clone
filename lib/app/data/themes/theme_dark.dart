import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryTheme1 = Color(0xFF1a152b);
const Color primaryTheme2 = Color(0xFF0b0a1c);

ThemeData darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: primaryTheme1,
    // appBarTheme: AppBarTheme(backgroundColor: Constants.primaryColor),
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    }),
    backgroundColor: Color(0xFF312c40),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryTheme1,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
    ),
    primaryColor: primaryTheme1,
    canvasColor: primaryTheme1,
    cardColor: primaryTheme1,
    dividerColor: Colors.transparent,
    textTheme: GoogleFonts.nunitoSansTextTheme().apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ));
