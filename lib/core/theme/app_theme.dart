import 'package:flutter/material.dart';

import 'color_schemes/dark_color_scheme.dart';
import 'color_schemes/light_color_scheme.dart';
import 'text_themes/base_text_theme.dart';
import 'theme_builder.dart';

/// A comprehensive theme configuration class for the application.
/// Provides both light and dark theme modes with consistent styling.

class AppTheme {
  // Private constructor to prevent instantiation.
  AppTheme._();

  static ThemeData get lightMode {
    return ThemeBuilder.buildTheme(
      colorScheme: LightColorScheme.colorScheme,
      textTheme: AppTextTheme.baseTextTheme,
      isDark: false,
    );
  }

  static ThemeData get darkMode {
    return ThemeBuilder.buildTheme(
      colorScheme: DarkColorScheme.colorScheme,
      textTheme: AppTextTheme.baseTextTheme,
      isDark: true,
    );
  }
}
