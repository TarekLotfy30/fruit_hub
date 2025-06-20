import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';

abstract final class DarkColorScheme {
  const DarkColorScheme._();

  /// Dark theme color scheme using AppColors
  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.dark,

    // ========== PRIMARY COLORS ==========
    primary: AppColors.green1_300, // Lighter green1 for dark theme
    onPrimary: AppColors.green1_900, // Dark text on light primary
    primaryContainer: AppColors.green1_700, // Dark green1 container
    onPrimaryContainer: AppColors.green1_100, // Light text on dark container
    // ========== SECONDARY COLORS ==========
    secondary: AppColors.orange300, // Lighter orange for dark theme
    onSecondary: AppColors.orange900, // Dark text on light secondary
    secondaryContainer: AppColors.orange700, // Dark orange container
    onSecondaryContainer: AppColors.orange100, // Light text on dark container
    // ========== TERTIARY COLORS ==========
    tertiary: AppColors.green300, // Lighter bright green for dark theme
    onTertiary: AppColors.green900, // Dark text on light tertiary
    tertiaryContainer: AppColors.green700, // Dark green container
    onTertiaryContainer: AppColors.green100, // Light text on dark container
    // ========== ERROR COLORS ==========
    error: AppColors.errorLight, // Lighter error for dark theme
    onError: AppColors.errorDark,
    errorContainer: Color(0xFF7F1D1D), // Dark red container
    onErrorContainer: AppColors.errorLight,

    // ========== SURFACE COLORS ==========
    surface: AppColors.darkSurface, // Dark background
    onSurface: AppColors.grayscale100, // Light text on dark surface
    // Dark surface variants
    surfaceContainerHighest: AppColors.darkSurfaceElevated3,
    surfaceContainerHigh: AppColors.darkSurfaceElevated2,
    surfaceContainer: AppColors.darkSurfaceElevated1,
    surfaceContainerLow: AppColors.darkSurface,
    surfaceContainerLowest: AppColors.grayscale900,

    onSurfaceVariant: AppColors.grayscale300,

    // ========== OUTLINE COLORS ==========
    outline: AppColors.grayscale600,
    outlineVariant: AppColors.grayscale700,

    // ========== UTILITY COLORS ==========
    shadow: AppColors.black,
    scrim: AppColors.black,

    // Inverse colors
    inverseSurface: AppColors.grayscale100,
    onInverseSurface: AppColors.grayscale800,
    inversePrimary: AppColors.primary,

    surfaceTint: AppColors.green1_300,
  );
}
