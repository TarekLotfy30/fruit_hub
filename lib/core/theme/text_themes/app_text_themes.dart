import 'package:flutter/material.dart';

import '../../utils/styles/app_typography.dart';

abstract final class AppTextThemes {
  const AppTextThemes._();

  /// Base text theme using the primary font family with proper type mapping
  ///
  /// Maps Material Design text styles to custom typography:
  /// - Display styles (23pt): For large headings
  /// - Headline styles (19pt): For section headers
  /// - Title styles (16pt): For card titles and buttons
  /// - Label styles (13pt): For labels and small text
  /// - Body styles (11pt): For body text
  static final TextTheme textTheme = TextTheme(
    // Display styles (23pt) - Large headings
    displayLarge: AppTypography.textStyle23Bold,
    // displayMedium: AppTypography.textStyle23Bold,
    // displaySmall: AppTypography.displaySmall,

    // Headline styles (19pt) - Section headers
    headlineLarge: AppTypography.textStyle19Bold,
    //headlineMedium: AppTypography.textStyle19Bold,
    //headlineSmall: AppTypography.headlineSmall,

    // Title styles (16pt) - Card titles, button text
    titleLarge: AppTypography.textStyle16Bold,
    titleMedium: AppTypography.textStyle16Semibold,
    titleSmall: AppTypography.textStyle16Regular,

    // Label styles (13pt) - Labels, captions
    labelLarge: AppTypography.textStyle13Bold,
    labelMedium: AppTypography.textStyle13semiBold,
    labelSmall: AppTypography.textStyle13regular,

    // Body styles (11pt) - Body text
    //bodyLarge: AppTypography.bodyLarge,
    bodyMedium: AppTypography.textStyle11SemiBold,
    //bodySmall: AppTypography.bodySmall
  );
}

// TEXT USAGE EXAMPLES:
/*
// Method 1: Using Theme.of(context).textTheme (Recommended - automatically adapts to theme)
Text(
  'Main Title',
  style: Theme.of(context).textTheme.headlineLarge, // Uses correct color for current theme
)

Text(
  'Body content goes here',
  style: Theme.of(context).textTheme.bodyMedium, // Secondary text color
)

Text(
  'Small helper text',
  style: Theme.of(context).textTheme.bodySmall, // Tertiary text color
)

// Method 2: Direct color usage (when you need specific control)
Text(
  'Primary text',
  style: TextStyle(
    color: AppColors.textPrimary, // Will be grayscale900 in light theme
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ),
)

Text(
  'Secondary information',
  style: TextStyle(
    color: AppColors.textSecondary, // Will be grayscale700 in light theme
    fontSize: 14,
  ),
)

Text(
  'Subtle text',
  style: TextStyle(
    color: AppColors.textTertiary, // Will be grayscale500 in light theme
    fontSize: 12,
  ),
)

// Method 3: For special cases
Text(
  'Error message',
  style: TextStyle(
    color: Theme.of(context).brightness == Brightness.light 
        ? AppColors.textError 
        : AppColors.textErrorDark,
    fontSize: 14,
  ),
)

Text(
  'Click here',
  style: TextStyle(
    color: Theme.of(context).brightness == Brightness.light 
        ? AppColors.textLink 
        : AppColors.textLinkDark,
    fontSize: 14,
    decoration: TextDecoration.underline,
  ),
)

// Method 4: Disabled text
Text(
  'Disabled option',
  style: TextStyle(
    color: Theme.of(context).brightness == Brightness.light 
        ? AppColors.textDisabled 
        : AppColors.textDisabledDark,
    fontSize: 14,
  ),
)
*/
