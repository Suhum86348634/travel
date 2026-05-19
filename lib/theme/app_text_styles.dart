import 'package:flutter/material.dart';

class AppFonts {
  AppFonts._();

  static const String display = 'Merriweather';
  static const String body = 'SourceSansPro';
}

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle hero = TextStyle(
    fontFamily: AppFonts.display,
    fontSize: 34,
    fontWeight: FontWeight.w700,
    height: 1.25,
    letterSpacing: -0.5,
  );

  static const TextStyle h1 = TextStyle(
    fontFamily: AppFonts.display,
    fontSize: 26,
    fontWeight: FontWeight.w700,
    height: 1.3,
    letterSpacing: -0.3,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: AppFonts.display,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.35,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.6,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.55,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 12,
    fontWeight: FontWeight.w200,
    height: 1.5,
  );

  static const TextStyle filterActive = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
  );

  static const TextStyle filterInactive = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.1,
  );

  static const TextStyle button = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.3,
  );

  static const TextStyle price = TextStyle(
    fontFamily: AppFonts.display,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
  );

  static const TextStyle rating = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle navLabel = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.2,
  );
}
