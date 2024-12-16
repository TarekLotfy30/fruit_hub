import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

/// A utility class for defining app themes using ThemeData.
class AppTheme {
  AppTheme._(); // Private constructor to prevent instantiation.

  /// Defines the light mode theme.
  static ThemeData lightMode = ThemeData.light().copyWith(
    pageTransitionsTheme: _pageTransitionsTheme,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    /*    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
      shape: CircleBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 0.85,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 1,
        ),
      ),
      labelStyle: const TextStyle(
        fontSize: 13,
        fontFamily: 'Lato',
      ),
      floatingLabelStyle: const TextStyle(
        color: AppColors.primaryColor,
        fontSize: 13,
        fontFamily: 'Lato',
      ),
      prefixIconColor: AppColors.primaryColor,
      suffixIconColor: AppColors.primaryColor,
    ),*/
  );

  /// Defines the page transition animations for different platforms.
  static const PageTransitionsTheme _pageTransitionsTheme =
      PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );

  /// Defines the dark mode theme.
}
