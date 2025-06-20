import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';

abstract final class LightColorScheme {
  const LightColorScheme._();

  /// Light theme color scheme using AppColors
  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.light,

    // ========== PRIMARY COLORS ==========
    // Using green1_500 as primary (as defined in AppColors.primary)
    primary: AppColors.primary, // #1B5E37 (green1_500)
    onPrimary: AppColors.textOnPrimary, // White text on primary
    primaryContainer: AppColors.green1_100, // Light green1 container
    onPrimaryContainer: AppColors.green1_800, // Dark green1 text on light
    // ========== SECONDARY COLORS ==========
    // Using orange palette for secondary
    secondary: AppColors.secondary, // orange600 (#C2820A)
    onSecondary: AppColors.textOnSecondary, // White text on secondary
    secondaryContainer: AppColors.orange100, // Light orange container
    onSecondaryContainer: AppColors.orange800, // Dark orange text
    // ========== TERTIARY COLORS ==========
    // Using the bright green (green500) for tertiary as it's used for buttons/FAB
    tertiary: AppColors.green500, // #6CDC46(the bright green from your comment)
    onTertiary: AppColors.white, // White text on bright green
    tertiaryContainer: AppColors.green100, // Light green container
    onTertiaryContainer: AppColors.green800, // Dark green text
    // ========== ERROR COLORS ==========
    error: AppColors.error, // #E53E3E
    onError: AppColors.white,
    errorContainer: AppColors.errorLight, // Using defined error light
    onErrorContainer: AppColors.errorDark, // Using defined error dark
    // ========== SURFACE COLORS ==========
    surface: AppColors.surface, // White background
    onSurface: AppColors.textPrimary, // Primary text color
    // Surface variants for better hierarchy
    surfaceContainerHighest: AppColors.grayscale50, // Highest elevation
    surfaceContainerHigh: AppColors.surfaceElevated3, // High elevation
    surfaceContainer: AppColors.surfaceElevated2, // Medium elevation
    surfaceContainerLow: AppColors.surfaceElevated1, // Low elevation
    surfaceContainerLowest: AppColors.background, // Lowest elevation

    onSurfaceVariant: AppColors.textSecondary, // Secondary text
    // ========== OUTLINE COLORS ==========
    outline: AppColors.border, // Primary border color
    outlineVariant: AppColors.divider, // Subtle divider color
    // ========== UTILITY COLORS ==========
    shadow: AppColors.grayscale900, // Shadow color
    scrim: AppColors.black, // Modal scrim
    // Inverse colors for contrast
    inverseSurface: AppColors.grayscale800,
    onInverseSurface: AppColors.grayscale100,
    inversePrimary: AppColors.green1_200, // Light version of primary
    // Surface tint (used for elevation tinting)
    surfaceTint: AppColors.primary,
  );
}
