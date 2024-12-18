import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import 'app_styles.dart';

/// A utility class for defining app themes using ThemeData.
class AppTheme {
  const AppTheme._(); // Private constructor to prevent instantiation.

  /// Defines the light mode theme.
  static final ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    pageTransitionsTheme: AppStyles.pageTransitionsTheme,
    elevatedButtonTheme: AppStyles.elevatedButtonLightTheme,
    textTheme: AppStyles.textLightTheme,
  );

  /// Defines the dark mode theme.
  static final ThemeData darkMode = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black,
    pageTransitionsTheme: AppStyles.pageTransitionsTheme,
    textTheme: AppStyles.textDarkTheme,
    elevatedButtonTheme: AppStyles.elevatedButtonDarkTheme,
  );
}
