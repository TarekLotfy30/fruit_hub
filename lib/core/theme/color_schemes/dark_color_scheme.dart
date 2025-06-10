import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';

abstract final class DarkColorScheme {
  const DarkColorScheme._();

   /// Dark theme color scheme
  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.dark,

    // PRIMARY - Slightly lighter green for dark theme
    primary: AppColors.green400, // #76DF53 (visible on dark)
    onPrimary: AppColors.grayscale900, // Dark text on light green
    primaryContainer: AppColors.green700, // Darker green container
    onPrimaryContainer: AppColors.green200, // Light green text
    // SECONDARY - Lighter orange for dark theme
    secondary: AppColors.orange400, // #F5B53D
    onSecondary: AppColors.grayscale900, // Dark text on light orange
    secondaryContainer: AppColors.orange700, // Darker orange container
    onSecondaryContainer: AppColors.orange200, // Light orange text
    // TERTIARY - Lighter green1 for dark theme
    tertiary: AppColors.green1_400, // #60D290
    onTertiary: AppColors.grayscale900, // Dark text on light tertiary
    tertiaryContainer: AppColors.green1_700, // Darker green1 container
    onTertiaryContainer: AppColors.green1_200, // Light green1 text
    // ERROR - Lighter red for dark theme
    error: Color(0xFFF87171), // Light red
    onError: AppColors.grayscale900, // Dark text on light red
    errorContainer: Color(0xFF7F1D1D), // Dark red container
    onErrorContainer: Color(0xFFFEE2E2), // Light red text
    // SURFACES - Dark backgrounds
    surface: Color(0xFF121212), // Material dark surface
    onSurface: AppColors.grayscale100, // Light text on dark surface
    surfaceContainerHighest: AppColors.grayscale700, // Elevated dark surface
    onSurfaceVariant: AppColors.grayscale300, // Medium light text
    // OUTLINES & BORDERS - Lighter for dark theme
    outline: AppColors.grayscale500, // Medium gray
    outlineVariant: AppColors.grayscale600, // Slightly lighter gray
    // UTILITY COLORS
    shadow: AppColors.black,
    scrim: AppColors.black,
    inverseSurface: AppColors.grayscale100, // Light surface for inverse
    onInverseSurface: AppColors.grayscale800, // Dark text on light inverse
    inversePrimary: AppColors.green600, // Darker green for inverse
    surfaceTint: AppColors.green400, // Match primary
  );
}
