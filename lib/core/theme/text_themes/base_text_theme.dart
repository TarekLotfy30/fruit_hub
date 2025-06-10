import 'package:flutter/material.dart';
import '../../utils/styles/app_typography.dart';

abstract final class AppTextTheme {
  const AppTextTheme._();

  /// Base text theme using the primary font family with proper type mapping
  ///
  /// Maps Material Design text styles to custom typography:
  /// - Display styles (23pt): For large headings
  /// - Headline styles (19pt): For section headers
  /// - Title styles (16pt): For card titles and buttons
  /// - Label styles (13pt): For labels and small text
  /// - Body styles (11pt): For body text
  static final TextTheme baseTextTheme = TextTheme(
    // Display styles (23pt) - Large headings
    //displayMedium: AppTypography.displayMedium,
    //displayLarge: AppTypography.displayLarge,
    displaySmall: AppTypography.textStyle23Bold,

    // Headline styles (19pt) - Section headers
    //headlineLarge: AppTypography.headlineLarge,
    headlineMedium: AppTypography.textStyle19Bold,
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
