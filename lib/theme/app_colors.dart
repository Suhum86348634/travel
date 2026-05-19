import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Primary (olive / earthy) ───────────────────────────────
  static const Color primary = Color(0xFF6B7A52);       // оливковый
  static const Color primaryMed = Color(0xFF8F9D73);    // светлый оливковый
  static const Color primaryLight = Color(0xFFDDE3CF);  // очень светлый
  static const Color primaryDark = Color(0xFF4E5A3C);   // тёмный оливковый

  // ── Accent (теплый песочный) ───────────────────────────────
  static const Color accent = Color(0xFFD6A85C); // песочно-золотой

  // ── Light theme ────────────────────────────────────────────
  static const Color lightBackground = Color(0xFFF5F3EE); // беж
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightDivider = Color(0xFFE5E1D8);

  static const Color lightTextPrimary = Color(0xFF2E2A25); // почти шоколад
  static const Color lightTextSecondary = Color(0xFF6E665C);
  static const Color lightTextHint = Color(0xFFA39A8F);

  static const Color lightIconInactive = Color(0xFFA39A8F);
  static const Color lightNavBar = Color(0xFFFFFFFF);

  // ── Dark theme (теплый dark, не синюшный!) ────────────────
  static const Color darkBackground = Color(0xFF1F1B16);
  static const Color darkSurface = Color(0xFF2A2520);
  static const Color darkCard = Color(0xFF332D27);
  static const Color darkDivider = Color(0xFF3D362F);

  static const Color darkTextPrimary = Color(0xFFF2EEE9);
  static const Color darkTextSecondary = Color(0xFFC2BBB2);
  static const Color darkTextHint = Color(0xFF8E857B);

  static const Color darkIconInactive = Color(0xFF8E857B);
  static const Color darkNavBar = Color(0xFF2A2520);

  // ── Semantic ───────────────────────────────────────────────
  static const Color success = Color(0xFF7BAE7F);
  static const Color warning = Color(0xFFD6A85C);
  static const Color error = Color(0xFFB85C5C);
  static const Color rating = Color(0xFFD6A85C);

  // ── Utils ──────────────────────────────────────────────────
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
}