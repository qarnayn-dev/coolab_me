import 'package:coolab_me/configs/app_theme.dart';
import 'package:flutter/material.dart';

/// A Tailwind inspired shadow theme.
class ShadowTheme {
  static final Color colorBase = Color.alphaBlend(Colors.black.withOpacity(0.8), AppTheme.primary).withOpacity(0.1);

  static Color get colorSM => Color.alphaBlend(Colors.black.withOpacity(0.8), AppTheme.primary).withOpacity(0.3);
  static Color get colorMD => Color.alphaBlend(Colors.black.withOpacity(0.8), AppTheme.primary).withOpacity(0.4);
  static Color get colorLG => Color.alphaBlend(Colors.black.withOpacity(0.8), AppTheme.primary).withOpacity(0.6);

  static final List<BoxShadow> boxShadowSM = [
    BoxShadow(offset: const Offset(0, 1), blurRadius: 1, color: const Color(0x00000000).withOpacity(0.05)),
  ];

  static final List<BoxShadow> boxShadow = [
    BoxShadow(offset: const Offset(0, 1), blurRadius: 2, color: const Color(0x00000000).withOpacity(0.1)),
    BoxShadow(offset: const Offset(0, 1), blurRadius: 1, color: const Color(0x00000000).withOpacity(0.06)),
  ];

  static final List<BoxShadow> boxShadowMD = [
    BoxShadow(offset: const Offset(0, 4), blurRadius: 3, color: const Color(0x00000000).withOpacity(0.07)),
    BoxShadow(offset: const Offset(0, 2), blurRadius: 2, color: const Color(0x00000000).withOpacity(0.06)),
  ];

  static final List<BoxShadow> boxShadowLG = [
    BoxShadow(offset: const Offset(0, 10), blurRadius: 8, color: const Color(0x00000000).withOpacity(0.04)),
    BoxShadow(offset: const Offset(0, 4), blurRadius: 3, color: const Color(0x00000000).withOpacity(0.1)),
  ];

  static final List<BoxShadow> boxShadowXL = [
    BoxShadow(offset: const Offset(0, 20), blurRadius: 13, color: const Color(0x00000000).withOpacity(0.03)),
    BoxShadow(offset: const Offset(0, 8), blurRadius: 5, color: const Color(0x00000000).withOpacity(0.08)),
  ];
}
