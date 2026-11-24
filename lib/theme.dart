import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color bg = Color(0xFF0B1120);
  static const Color surface = Color(0xFF111A2E);
  static const Color surfaceHigh = Color(0xFF16223B);
  static const Color border = Color(0xFF22304D);
  static const Color text = Color(0xFFE6EDF7);
  static const Color muted = Color(0xFF94A3B8);
  static const Color accent = Color(0xFF38BDF8); // sky
  static const Color accent2 = Color(0xFF818CF8); // indigo
}

class Breakpoints {
  static const double mobile = 720;
  static const double maxContent = 1100;
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < mobile;
}

ThemeData buildTheme() {
  final base = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.bg,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.accent,
      secondary: AppColors.accent2,
      surface: AppColors.surface,
    ),
  );
  return base.copyWith(
    textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
      bodyColor: AppColors.text,
      displayColor: AppColors.text,
    ),
  );
}
