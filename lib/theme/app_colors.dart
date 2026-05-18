import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────────
//  APP COLORS  ·  Figma "Travel APP (Community)"
// ─────────────────────────────────────────────────────────────────

class AppColors {
  AppColors._();

  // ── Primary (lavender-violet) ───────────────────────────────────
  static const Color primary = Color(0xFF6A62B7); // кнопки, активные иконки
  static const Color primaryMed = Color(0xFF897CFF); // акценты, индикаторы
  static const Color primaryLight = Color(0xFFD0CBFF); // фон баннеров, карточек
  static const Color primaryDark = Color(0xFF403A7A); // тёмный акцент

  // ── Accent ──────────────────────────────────────────────────────
  static const Color accent = Color(0xFFFF54A0); // лайки, звёзды, highlights

  // ── Light theme ─────────────────────────────────────────────────
  static const Color lightBackground = Color(0xFFFAF9FF);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightDivider = Color(0xFFEEECF8);
  static const Color lightTextPrimary = Color(0xFF1A1730);
  static const Color lightTextSecondary = Color(0xFF6B6884);
  static const Color lightTextHint = Color(0xFFB0AECB);
  static const Color lightIconInactive = Color(0xFFB0AECB);
  static const Color lightNavBar = Color(0xFFFFFFFF);

  // ── Dark theme ──────────────────────────────────────────────────
  static const Color darkBackground = Color(0xFF13111F);
  static const Color darkSurface = Color(0xFF1E1B2E);
  static const Color darkCard = Color(0xFF252238);
  static const Color darkDivider = Color(0xFF2E2A45);
  static const Color darkTextPrimary = Color(0xFFF0EEFF);
  static const Color darkTextSecondary = Color(0xFFA09DC0);
  static const Color darkTextHint = Color(0xFF5E5B7A);
  static const Color darkIconInactive = Color(0xFF5E5B7A);
  static const Color darkNavBar = Color(0xFF1E1B2E);

  // ── Semantic (theme-independent) ────────────────────────────────
  static const Color success = Color(0xFF4CAF8C);
  static const Color warning = Color(0xFFFFB547);
  static const Color error = Color(0xFFFF5C6E);
  static const Color rating = Color(0xFFFFB547);

  // ── Utils ───────────────────────────────────────────────────────
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
}
