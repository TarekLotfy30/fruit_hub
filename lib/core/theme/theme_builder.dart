import 'package:flutter/material.dart';

import '../utils/styles/app_fonts_family.dart';
import 'component_themes/app_bar_theme.dart';
import 'component_themes/app_button_themes.dart';
import 'component_themes/app_card_theme.dart';
import 'component_themes/app_checkbox_theme.dart';
import 'component_themes/app_chip_theme.dart';
import 'component_themes/app_dialog_theme.dart';
import 'component_themes/app_divider_theme.dart';
import 'component_themes/app_input_theme.dart';
import 'component_themes/app_switch_theme.dart';
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

      // Add splash color configuration
      splashColor: colorScheme.primary.withValues(alpha: 0.12),
      highlightColor: colorScheme.primary.withValues(alpha: 0.08),

      // Component themes
      appBarTheme: AppBarThemes.appBarTheme(colorScheme),
      floatingActionButtonTheme: AppButtonThemes.fabTheme(colorScheme),
      elevatedButtonTheme: AppButtonThemes.elevatedButtonTheme(colorScheme),
      outlinedButtonTheme: AppButtonThemes.outlinedButtonTheme(colorScheme),
      textButtonTheme: AppButtonThemes.textButtonTheme(colorScheme),
      cardTheme: AppCardTheme.cardTheme(colorScheme),
      checkboxTheme: AppCheckBoxTheme.checkboxTheme(colorScheme),
      chipTheme: AppChipTheme.chipTheme(colorScheme),
      dialogTheme: AppDialogTheme.dialogTheme(colorScheme),
      dividerTheme: AppDividerTheme.dividerTheme(colorScheme),
      inputDecorationTheme: AppInputTheme.inputDecorationTheme(
        colorScheme,
        isDark: isDark,
      ),
      switchTheme: AppSwitchTheme.switchTheme(colorScheme),
    );
  }
}
