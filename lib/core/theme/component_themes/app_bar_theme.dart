import 'package:flutter/material.dart';

import '../../constants/app_elevation.dart';
import '../text_themes/base_text_theme.dart';

class AppBarThemes {
  AppBarThemes._();

  static AppBarTheme buildAppBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
      backgroundColor: colorScheme.surface, // Clean white background
      foregroundColor: colorScheme.onSurface, // Dark text/icons
      elevation: AppElevation.appBarElevation, // 0
      centerTitle: true,
      surfaceTintColor: colorScheme.primary, // Tint when scrolled
      titleTextStyle: AppTextTheme.baseTextTheme.headlineMedium,
    );
  }
}
