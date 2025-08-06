import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';

abstract final class DarkColorScheme {
  /// Dark theme color scheme using AppColors
  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.dark,

    // ========== PRIMARY COLORS ==========
    primary: AppColors.green400,
    // Lighter green1 for dark theme
    onPrimary: AppColors.green900,
    // Dark text on light primary
    primaryContainer: AppColors.green700,
    // Dark green1 container
    onPrimaryContainer: AppColors.green100,
    // Light text on dark container
    // ========== SECONDARY COLORS ==========
    secondary: AppColors.green1_400,
    // Lighter orange for dark theme
    onSecondary: AppColors.green1_900,
    // Dark text on light secondary
    secondaryContainer: AppColors.green1_700,
    onSecondaryContainer: AppColors.green1_100,
    // ========== TERTIARY COLORS ==========
    tertiary: AppColors.orange400,
    // Lighter bright green for dark theme
    onTertiary: AppColors.orange900,
    // Dark text on light tertiary
    tertiaryContainer: AppColors.orange700,
    // Dark green container
    onTertiaryContainer: AppColors.orange100,
    // Light text on dark container
    // ========== SURFACE COLORS ==========
    surface: AppColors.darkSurface,
    // Dark background
    onSurface: AppColors.white,
    // Light text on dark surface
    // Dark surface variants
    surfaceContainerHighest: AppColors.grayscale700,
    surfaceContainerHigh: AppColors.grayscale700,
    surfaceContainer: AppColors.grayscale800,
    surfaceContainerLow: AppColors.grayscale800,
    surfaceContainerLowest: AppColors.grayscale900,

    onSurfaceVariant: AppColors.textDisabled,

    // ========== OUTLINE COLORS ==========
    outline: AppColors.grayscale600,
    outlineVariant: AppColors.grayscale700,

    // ========== UTILITY COLORS ==========
    shadow: AppColors.black,
    scrim: AppColors.black,

    // Inverse colors
    inverseSurface: AppColors.grayscale100,
    onInverseSurface: AppColors.grayscale800,
    inversePrimary: AppColors.green600,
    surfaceTint: AppColors.green400,

    // ========== ERROR COLORS ==========
    error: AppColors.error,
    // Lighter error for dark theme
    onError: AppColors.white,
    errorContainer: AppColors.errorDark,
    onErrorContainer: AppColors.errorLight,
  );
}
