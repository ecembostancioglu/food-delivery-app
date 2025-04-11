import 'package:flutter/material.dart';

class AppColorsExtensions extends ThemeExtension<AppColorsExtensions> {
  final Color primary;
  final Color background;
  final Color error;
  final Color surface;

  AppColorsExtensions(
      {required this.primary,
      required this.background,
      required this.error,
      required this.surface});

  @override
  ThemeExtension<AppColorsExtensions> copyWith(
      {Color? primary, Color? background, Color? error, Color? surface}) {
    return AppColorsExtensions(
        primary: primary ?? this.primary,
        background: background ?? this.background,
        error: error ?? this.error,
        surface: surface ?? this.surface);
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
    );
  }
}
