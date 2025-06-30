import 'package:flutter/material.dart';

import '../../constants/app_elevation.dart';
import '../../utils/styles/app_fonts_family.dart';
import '../text_themes/base_text_theme.dart';

abstract final class AppBarThemes {
  AppBarThemes._();

  static AppBarTheme appBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
      backgroundColor: colorScheme.surface, // Clean white background
      foregroundColor: colorScheme.onSurface, // Dark text/icons
      elevation: AppElevation.appBarElevation, // 0
      scrolledUnderElevation: AppElevation.appBarScrolledUnderElevation, //1
      centerTitle: true,
      surfaceTintColor: colorScheme.primary, // Tint when scrolled

      titleTextStyle: AppTextThemes.baseTextTheme.headlineMedium?.copyWith(
        color: colorScheme.onSurface,
        fontFamily: AppFontFamily.cairo,
      ),
      toolbarTextStyle: AppTextThemes.baseTextTheme.titleLarge?.copyWith(
        color: colorScheme.onSurface,
        fontFamily: AppFontFamily.cairo,
      ),
      actionsIconTheme: IconThemeData(color: colorScheme.onSurface),
      iconTheme: IconThemeData(color: colorScheme.onSurface),
      shadowColor: colorScheme.shadow,
    );
  }
}
