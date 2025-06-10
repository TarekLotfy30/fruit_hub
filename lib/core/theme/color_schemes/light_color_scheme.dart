import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';

abstract final class LightColorScheme {
  const LightColorScheme._();

  /// Light theme color scheme
  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.light,

    // PRIMARY - Using green500 as mentioned in your comment
    primary: AppColors.green500, // #6CDC46 (main buttons, FAB)
    onPrimary: AppColors.white, // White text on green buttons
    primaryContainer: AppColors.green100, // Light green container
    onPrimaryContainer: AppColors.green800, // Darkgreen text on light container
    // SECONDARY - Orange palette
    secondary: AppColors.orange500, // #F4A91F (brighter than 600)
    onSecondary: AppColors.white, // White text on orange
    secondaryContainer: AppColors.orange100, // Light orange container
    onSecondaryContainer: AppColors.orange800, // Dark orange text
    // TERTIARY - Secondary green palette
    tertiary: AppColors.green1_600, // #2D9F5D
    onTertiary: AppColors.white, // White text on tertiary
    tertiaryContainer: AppColors.green1_100, // Light green1 container
    onTertiaryContainer: AppColors.green1_800, // Dark green1 text
    // ERROR
    error: AppColors.error, // #E53E3E
    onError: AppColors.white,
    errorContainer: Color(0xFFFEE2E2), // Light red container
    onErrorContainer: Color(0xFF7F1D1D), // Dark red text
    // SURFACES
    surface: AppColors.surface, // White
    onSurface: AppColors.textPrimary, // Dark gray text
    surfaceContainerHighest: AppColors.grayscale50, // Very light gray
    onSurfaceVariant: AppColors.textSecondary, // Medium gray text
    // OUTLINES & BORDERS
    outline: AppColors.border, // Gray300
    outlineVariant: AppColors.divider, // Gray200
    // UTILITY COLORS
    shadow: AppColors.grayscale900,
    scrim: AppColors.black,
    inverseSurface: AppColors.grayscale800,
    onInverseSurface: AppColors.grayscale100,
    inversePrimary: AppColors.green200,
    surfaceTint: AppColors.green500, // Match primary
  );
}
