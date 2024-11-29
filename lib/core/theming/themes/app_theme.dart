import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theming/colors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

/// A utility class for defining app themes using ThemeData.
class AppTheme {
  AppTheme._(); // Private constructor to prevent instantiation.

  /// Defines the light mode theme.
  static ThemeData lightMode = ThemeData.light().copyWith(
    textTheme: _textTheme,
    pageTransitionsTheme: _pageTransitionsTheme,
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

  /// Defines the text styles using Google Fonts.
  static final TextTheme _textTheme = GoogleFonts.cairoTextTheme(
    ThemeData.light().textTheme,
  );

  /// Defines the dark mode theme.
}
