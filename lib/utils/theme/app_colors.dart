import 'dart:ui';

abstract class AppColors {
  static const red = Color.fromARGB(255, 201, 0, 0);
  static const green = Color(0xFF2ECC71);
  static const seashell = Color(0xFFF7EBE8);
  static const grey = _GreyColors();
}

class _GreyColors{
  const _GreyColors();

  final grey50 = const Color(0xFFFAFAFA);
  final grey100 = const Color(0xFFF5F5F5);
  final grey500 = const Color(0xFF9E9E9E);
}