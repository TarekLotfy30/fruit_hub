import 'package:flutter/material.dart';

import '../utils/styles/app_fonts_family.dart';
import 'component_themes/app_bar_theme.dart';
import 'component_themes/app_button_themes.dart';
import 'component_themes/app_card_theme.dart';
import 'component_themes/app_divider_theme.dart';
import 'component_themes/app_input_theme.dart';
import 'theme_constant/theme_constants.dart';

/// Theme builder class that constructs complete ThemeData objects.
///
/// This class combines all theme components into cohesive theme configurations
/// for both light and dark modes.

abstract final class ThemeBuilder {
  const ThemeBuilder._();

  /// Builds a complete ThemeData object with all component themes
  static ThemeData buildTheme({
    required ColorScheme colorScheme,
    required TextTheme textTheme,
    required bool isDark,
  }) {
    return ThemeData(
      // Core theme properties
      visualDensity: ThemeConstants.visualDensity,
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      fontFamily: AppFontFamily.cairo,
      scaffoldBackgroundColor: colorScheme.surface,
      textTheme: textTheme,
      pageTransitionsTheme: ThemeConstants.pageTransitionsTheme,

      // Component themes
      appBarTheme: AppBarThemes.buildAppBarTheme(colorScheme),
      floatingActionButtonTheme: AppButtonThemes.buildFABTheme(colorScheme),
      elevatedButtonTheme: AppButtonThemes.buildElevatedButtonTheme(
        colorScheme,
      ),
      outlinedButtonTheme: AppButtonThemes.buildOutlinedButtonTheme(
        colorScheme,
      ),
      inputDecorationTheme: AppInputTheme.buildInputDecorationTheme(
        colorScheme,
        isDark: isDark,
      ),
      cardTheme: AppCardTheme.buildCardTheme(colorScheme),
      dividerTheme: AppDividerTheme.buildDividerTheme(colorScheme),
    );
  }
}
