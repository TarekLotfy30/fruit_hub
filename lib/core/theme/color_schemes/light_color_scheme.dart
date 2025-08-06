// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';

abstract final class LightColorScheme {
  /// Light theme color scheme using AppColors
  /// Following Material 3 color system with your app's color palette
  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.light,

    // → Sets the overall brightness (affects contrast, shadows, etc.)

    // ========== PRIMARY COLORS ==========
    // → Main brand color used for ElevatedButtons, FABs, progress bars, switches.
    primary: AppColors.green1_850,
    // → Text/icon color that sits **on top** of primary (e.g., button text).
    onPrimary: AppColors.white,

    // → Background of elevated surfaces like cards or filled buttons (optional).
    primaryContainer: AppColors.green1_100,

    // → Text/icon color that sits on `primaryContainer`.
    onPrimaryContainer: AppColors.green1_800,

    // ========== SECONDARY COLORS ==========
    // → Accent color for chips, secondary buttons, or UI highlights.
    secondary: AppColors.green600,
    // → Text/icon color that sits on `secondary`.
    onSecondary: AppColors.white,
    // → Used in surfaces like chip backgrounds or side elements.
    secondaryContainer: AppColors.green100,
    // → Text/icon color on `secondaryContainer`.
    onSecondaryContainer: AppColors.green800,

    // ========== TERTIARY COLORS ==========
    // → Used for less prominent actions (e.g., FABs, sliders, progress bars).
    tertiary: AppColors.orange500,
    // → Text/icon color on `tertiary`.
    onTertiary: AppColors.white,
    // → Background for tertiary surfaces (cards, alerts, sheets).
    tertiaryContainer: AppColors.orange200,
    // → Text/icon color for `tertiaryContainer`.
    onTertiaryContainer: AppColors.orange800,

    // ========== SURFACE COLORS ==========
    // → Main background color for Scaffold, Cards, Sheets.
    surface: AppColors.white,
    // → Primary text/icon color on surface (e.g., headlines, labels).
    onSurface: AppColors.grayscale900,
    // → Highest elevated surfaces (menus, dialogs, app bars).
    surfaceContainerHighest: AppColors.grayscale50,
    // → High elevation (modals, sheets, snack bars).
    surfaceContainerHigh: AppColors.grayscale100,

    // → Default Card background.
    surfaceContainer: AppColors.grayscale200,
    // → Low elevation surface (buttons, light cards).
    surfaceContainerLow: AppColors.grayscale100,
    // → Lowest elevation background (usually Scaffold background).
    surfaceContainerLowest: Colors.white,
    // → Secondary text on surface (subtitles, hints, disabled text).
    onSurfaceVariant: AppColors.textSecondary,

    // ========== OUTLINE COLORS ==========
    // → Used for borders (TextFields, Cards, dividers, OutlinedButtons).
    outline: AppColors.grayscale300,
    // → Fainter version of outline (used for subtle borders or separators)
    outlineVariant: AppColors.grayscale200,

    // ========== UTILITY COLORS ==========
    // → Used for shadows of elevated components (cards, FABs, dialogs).
    shadow: AppColors.grayscale900,
    // → Used for modal backgrounds (e.g., behind BottomSheets, Dialogs).
    scrim: AppColors.grayscale900,

    // ========== INVERSE COLORS ==========
    // → Used for contrasting UI (e.g., dark Toasts or SnackBars on light theme).
    inverseSurface: AppColors.grayscale800,
    // → Text/icon color on `inverseSurface`.
    onInverseSurface: AppColors.grayscale100,
    // → Alternate primary for contrasting surface (e.g., loading overlays).
    inversePrimary: AppColors.green300,

    // ========== SURFACE TINT ==========\
    // → Used to tint elevated surfaces in Material 3 (adds color depth with elevation).
    surfaceTint: AppColors.green600,

    // ========== ERROR COLORS ==========
    // → Used for error states (TextField error borders, icons, snackbars).
    error: AppColors.error,

    // → Text/icon color on top of `error`.
    onError: AppColors.white,

    // → Background for error banners, error cards, alerts.
    errorContainer: AppColors.errorLight,

    // → Text/icon color for `errorContainer`.
    onErrorContainer: AppColors.errorDark,
  );
}
