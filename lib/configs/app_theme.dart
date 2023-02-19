import 'package:flutter/material.dart';

class AppTheme {
  static const int _primaryHex = 0xFFFFD4B2;
  // static const Color primary = Color(_primaryHex);

  static const MaterialColor primary = MaterialColor(
    _primaryHex,
    <int, Color>{
      50: Color(0xffffead9),
      100: Color(0xffffe5d1),
      200: Color(0xffffe1c9),
      300: Color(0xffffddc1),
      400: Color(0xffffd8ba),
      500: Color(_primaryHex),
      600: Color(0xffe6bfa0),
      700: Color(0xffccaa8e),
      800: Color(0xffb3947d),
      900: Color(0xff997f6b),
    },
  );

  static const Color primaryS2 = Color(0xFFF3B27F);
  static const Color primaryS3 = Color(0xFFEB914B);
  static const Color secondary = Color(0xFFFFF6BD);
  static const Color accent = Color(0xFFCEEDC7);
  static const Color accent2 = Color(0xFF86C8BC);
  static const Color nBlack = Color(0xFF242424);
  static const Color nGrey = Color(0xFFA0A0A0);
  static const Color nWhite = Color(0xFFEAEAEA);

  static const Map<int, Color> labelColor = {
    1: Color(0xFF39B5E0),
    2: Color(0xFF59CE8F),
    3: Color(0xFFEB455F),
    4: Color(0xFF7D1E6A),
    5: Color(0xFF24A19C),
    6: Color(0xFF8E0505),
    7: Color(0xFF292C6D),
    8: Color(0xFF1C7947),
    9: Color(0xFFEE5007),
    10: Color(0xFFFFC947),
  };
}
