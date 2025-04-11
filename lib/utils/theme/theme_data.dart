import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/extensions/app_color_extensions.dart';

class AppThemeData {
  static final light = ThemeData.light().copyWith(extensions: [
    _lightAppColors,
  ]);

  static final _lightAppColors = AppColorsExtensions(
      primary: const Color.fromRGBO(254, 140, 0, 0.9),
      background: const Color(0xffffffff),
      error: const Color(0xffb00020),
      surface: const Color(0xfff2f2f2),
      blurColor: const Color(0x33000000),
      textColor: const Color(0xff000000),
      onboardingText: const Color(0xFF0D47A1),
      dotColor: const Color(0x66FFFFFF),
      onPrimary: const Color(0xffffffff),
      onBackground: Colors.transparent



      );

  static final dark = ThemeData.dark().copyWith(
    extensions: [
      _darkAppColors,
    ],
  );

  static final _darkAppColors = AppColorsExtensions(
      primary: const Color(0xFFCB7200),
      background: const Color.fromARGB(255, 27, 26, 26),
      error: const Color.fromARGB(255, 235, 0, 43),
      surface: const Color.fromARGB(255, 22, 22, 22),
      blurColor: const Color(0x33000000),
      textColor: const Color(0xffffffff),
      onboardingText: const Color(0xFF0D47A1),
      dotColor: const Color(0x66FFFFFF),
      onPrimary: const Color(0xff000000),
      onBackground: Colors.transparent



      );
}
