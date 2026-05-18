import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => _buildLightTheme();
  static ThemeData get dark => _buildDarkTheme();
}

ThemeData _buildLightTheme() {
  const cs = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    primaryContainer: AppColors.primaryLight,
    onPrimaryContainer: AppColors.primaryDark,
    secondary: AppColors.accent,
    onSecondary: AppColors.white,
    secondaryContainer: Color(0xFFFFD6E8),
    onSecondaryContainer: Color(0xFF7A0040),
    surface: AppColors.lightSurface,
    onSurface: AppColors.lightTextPrimary,
    background: AppColors.lightBackground,
    onBackground: AppColors.lightTextPrimary,
    error: AppColors.error,
    onError: AppColors.white,
    outline: AppColors.lightDivider,
    shadow: Color(0x1A6A62B7),
  );

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: cs,
    scaffoldBackgroundColor: AppColors.lightBackground,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      foregroundColor: AppColors.lightTextPrimary,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: AppTextStyles.h1,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(color: AppColors.lightTextPrimary),
    ),

    dividerTheme: const DividerThemeData(
      color: AppColors.lightDivider,
      thickness: 1,
      space: 1,
    ),

    cardTheme: CardThemeData(
      color: AppColors.lightCard,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.zero,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.pressed)
              ? AppColors.primaryDark
              : AppColors.primary,
        ),
        foregroundColor: WidgetStateProperty.all(AppColors.white),
        overlayColor: WidgetStateProperty.all(Colors.white10),
        elevation: WidgetStateProperty.all(0),
        shadowColor: WidgetStateProperty.all(Colors.transparent),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        textStyle: WidgetStateProperty.all(AppTextStyles.button),
        animationDuration: const Duration(milliseconds: 150),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(AppColors.primary),
        side: WidgetStateProperty.all(
          const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
        textStyle: WidgetStateProperty.all(AppTextStyles.button),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(AppColors.primary),
        textStyle: WidgetStateProperty.all(
          AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightCard,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      hintStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.lightTextHint,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.lightDivider),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.lightDivider),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightNavBar,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.lightIconInactive,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedLabelStyle: AppTextStyles.navLabel,
      unselectedLabelStyle: AppTextStyles.navLabel,
    ),

    iconTheme: const IconThemeData(color: AppColors.lightTextPrimary),
    primaryIconTheme: const IconThemeData(color: AppColors.primary),
    textTheme: _buildTextTheme(AppColors.lightTextPrimary),
  );
}

ThemeData _buildDarkTheme() {
  const cs = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primaryMed,
    onPrimary: AppColors.white,
    primaryContainer: AppColors.primaryDark,
    onPrimaryContainer: AppColors.primaryLight,
    secondary: AppColors.accent,
    onSecondary: AppColors.white,
    secondaryContainer: Color(0xFF5C0030),
    onSecondaryContainer: Color(0xFFFFD6E8),
    surface: AppColors.darkSurface,
    onSurface: AppColors.darkTextPrimary,
    background: AppColors.darkBackground,
    onBackground: AppColors.darkTextPrimary,
    error: AppColors.error,
    onError: AppColors.white,
    outline: AppColors.darkDivider,
    shadow: Color(0x40000000),
  );

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: cs,
    scaffoldBackgroundColor: AppColors.darkBackground,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      foregroundColor: AppColors.darkTextPrimary,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: AppTextStyles.h1,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(color: AppColors.darkTextPrimary),
    ),

    dividerTheme: const DividerThemeData(
      color: AppColors.darkDivider,
      thickness: 1,
      space: 1,
    ),

    cardTheme: CardThemeData(
      color: AppColors.darkCard,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.zero,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.pressed)
              ? AppColors.primary
              : AppColors.primaryMed,
        ),
        foregroundColor: WidgetStateProperty.all(AppColors.white),
        overlayColor: WidgetStateProperty.all(Colors.white10),
        elevation: WidgetStateProperty.all(0),
        shadowColor: WidgetStateProperty.all(Colors.transparent),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        textStyle: WidgetStateProperty.all(AppTextStyles.button),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(AppColors.primaryMed),
        side: WidgetStateProperty.all(
          const BorderSide(color: AppColors.primaryMed, width: 1.5),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
        textStyle: WidgetStateProperty.all(AppTextStyles.button),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(AppColors.primaryMed),
        textStyle: WidgetStateProperty.all(
          AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkCard,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      hintStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.darkTextHint,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.darkDivider),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.darkDivider),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.primaryMed, width: 1.5),
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkNavBar,
      selectedItemColor: AppColors.primaryMed,
      unselectedItemColor: AppColors.darkIconInactive,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedLabelStyle: AppTextStyles.navLabel,
      unselectedLabelStyle: AppTextStyles.navLabel,
    ),

    iconTheme: const IconThemeData(color: AppColors.darkTextPrimary),
    primaryIconTheme: const IconThemeData(color: AppColors.primaryMed),
    textTheme: _buildTextTheme(AppColors.darkTextPrimary),
  );
}

TextTheme _buildTextTheme(Color base) => TextTheme(
  displayLarge: AppTextStyles.hero.copyWith(color: base),
  headlineLarge: AppTextStyles.h1.copyWith(color: base),
  headlineMedium: AppTextStyles.h2.copyWith(color: base),
  titleLarge: AppTextStyles.h3.copyWith(color: base),
  bodyLarge: AppTextStyles.bodyLarge.copyWith(color: base),
  bodyMedium: AppTextStyles.bodyMedium.copyWith(color: base),
  bodySmall: AppTextStyles.bodySmall.copyWith(color: base.withOpacity(0.6)),
  labelLarge: AppTextStyles.button.copyWith(color: base),
  labelSmall: AppTextStyles.navLabel.copyWith(color: base),
);
