// The BC extension for accessing Theme, allows us to get information about
// the colors and typography defined in our theme. This can be useful for
//maintaining consistency in the design of our application.
import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get appTheme => Theme.of(this);

  /// Gets the current color scheme from theme.
  ColorScheme get colorScheme => appTheme.colorScheme;

  /// Gets the current text theme.
  TextTheme get textTheme => appTheme.textTheme;

  /// Checks if device is in dark mode.
  bool get isDarkMode => appTheme.brightness == Brightness.dark;
}

// Extension usage
// final theme = context.apptheme;
// final primaryColor = theme.primaryColor;
// final accentColor = theme.accentColor;
// final textTheme = theme.textTheme;
