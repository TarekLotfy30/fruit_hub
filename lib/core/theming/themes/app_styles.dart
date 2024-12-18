import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import '../typography/app_text_style.dart';

/*    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
      shape: CircleBorder(),
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
    ),
   */
class AppStyles {
  const AppStyles._();

  //---------------------- Common Styles -------------------------
  /// Define Page transitions for iOS and Android.
  static const PageTransitionsTheme pageTransitionsTheme = PageTransitionsTheme(
    builders: {
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    },
  );

  /// Define Common ElevatedButton Style
  static final ButtonStyle baseElevatedButtonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(
      horizontal: 14,
      vertical: 12,
    ),
    backgroundColor: AppColors.primaryColor,
    elevation: 0,
    minimumSize: const Size(double.maxFinite, 52),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    textStyle: AppTextStyles.textStyle16.copyWith(
      fontWeight: FontWeight.bold,
      fontFamily: 'Cairo',
    ),
  );

  /// Define Common TextButton Style
  static final TextButtonThemeData textButtonStyle = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primaryColor,
      elevation: 0,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      textStyle: AppTextStyles.textStyle13.copyWith(
        fontFamily: 'Cairo',
      ),
    ),
  );

  //---------------------- Light Theme --------------------------

  /// Defines the ElevatedButton Light Theme
  static final ElevatedButtonThemeData elevatedButtonLightTheme =
      ElevatedButtonThemeData(
    style: baseElevatedButtonStyle.copyWith(
      foregroundColor: WidgetStateProperty.all(AppColors.white),
    ),
  );

  /// Defines the TextTheme Light Theme
  static final TextTheme textLightTheme = ThemeData.light().textTheme.apply(
        fontFamily: 'Cairo',
        displayColor: AppColors.black,
        bodyColor: AppColors.black,
      );

  //---------------------- Dark Theme --------------------------

  /// Defines the ElevatedButton Dark Theme
  static final ElevatedButtonThemeData elevatedButtonDarkTheme =
      ElevatedButtonThemeData(
    style: baseElevatedButtonStyle.copyWith(
      foregroundColor: WidgetStateProperty.all(AppColors.black),
    ),
  );

  /// Defines the TextTheme Dark Theme
  static final TextTheme textDarkTheme = ThemeData.dark().textTheme.apply(
        fontFamily: 'Cairo',
        displayColor: AppColors.white,
        bodyColor: AppColors.white,
      );
}
