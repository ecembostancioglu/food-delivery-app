import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class AppColorsExtensions extends ThemeExtension<AppColorsExtensions> {
  final Color primary;
  final Color background;
  final Color error;
  final Color surface;
  final Color blurColor;
  final Color textColor;
  final Color onboardingText;
  final Color dotColor;
  final Color onPrimary;
  final Color onBackground;

  AppColorsExtensions(
      {required this.primary,
      required this.background,
      required this.error,
      required this.surface,
      required this.blurColor,
      required this.textColor,
      required this.onboardingText,
      required this.dotColor,
      required this.onPrimary,
      required this.onBackground});

  @override
  ThemeExtension<AppColorsExtensions> copyWith(
      {Color? primary, Color? background, Color? error, Color? surface, Color? blurColor, Color? textColor, Color? onboardingText, Color? dotColor, Color? onPrimary, Color? onBackground}) {
    return AppColorsExtensions(
        primary: primary ?? this.primary,
        background: background ?? this.background,
        error: error ?? this.error,
        surface: surface ?? this.surface,
        blurColor: blurColor ?? this.blurColor,
        textColor: textColor ?? this.textColor,
        onboardingText: onboardingText ?? this.onboardingText,
        dotColor: dotColor ?? this.dotColor,
        onPrimary: onPrimary ?? this.onPrimary,
        onBackground: onBackground ?? this.onBackground,
        );
  }

  @override
  ThemeExtension<AppColorsExtensions> lerp(
      covariant ThemeExtension<AppColorsExtensions>? other, double t) {
    if (other is! AppColorsExtensions) {
      return this;
    }
    return AppColorsExtensions(
      primary: Color.lerp(primary, other.primary, t)!,
      background: Color.lerp(background, other.background, t)!,
      error: Color.lerp(error, other.error, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      blurColor: Color.lerp(blurColor, other.blurColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      onboardingText: Color.lerp(onboardingText, other.onboardingText, t)!,
      dotColor: Color.lerp(dotColor, other.dotColor, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
    );
  }
}
