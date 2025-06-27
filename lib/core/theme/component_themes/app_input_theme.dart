import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_border_width.dart';
import '../../constants/app_corners.dart';
import '../../constants/app_padding.dart';
import '../text_themes/base_text_theme.dart';

abstract final class AppInputTheme {
  AppInputTheme._();

  static InputDecorationTheme buildInputDecorationTheme(
    ColorScheme colorScheme, {
    required bool isDark,
  }) {
    return InputDecorationTheme(
      filled: true,
      fillColor: isDark
          ? colorScheme.surfaceContainerHighest
          : colorScheme.surface,

      // Default border (unfocused, enabled)
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCorners.smallBorderRadius.r),
        borderSide: BorderSide(
          color: colorScheme.outline,
          width: AppBorderWidth.defaultBorderWidth.w,
        ),
      ),

      // Enabled border
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCorners.smallBorderRadius.r),
        borderSide: BorderSide(
          color: colorScheme.outline,
          width: AppBorderWidth.defaultBorderWidth.w,
        ),
      ),

      // Focused border
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCorners.smallBorderRadius.r),
        borderSide: BorderSide(
          color: colorScheme.primary,
          width: AppBorderWidth.focusedBorderWidth.w,
        ),
      ),

      // Error border
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCorners.smallBorderRadius.r),
        borderSide: BorderSide(
          color: colorScheme.error,
          width: AppBorderWidth.defaultBorderWidth.w,
        ),
      ),

      // Focused error border
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCorners.smallBorderRadius.r),
        borderSide: BorderSide(
          color: colorScheme.error,
          width: AppBorderWidth.errorBorderWidth.w,
        ),
      ),

      // Disabled border
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCorners.smallBorderRadius.r),
        borderSide: BorderSide(
          color: colorScheme.outlineVariant,
          width: AppBorderWidth.defaultBorderWidth.w,
        ),
      ),

      // Hint styling
      hintStyle: AppTextThemes.baseTextTheme.labelMedium?.copyWith(
        color: isDark
            ? colorScheme.onSurfaceVariant
            : colorScheme.onSurface.withValues(alpha: 0.6),
      ),

      // Helper styling
      helperStyle: AppTextThemes.baseTextTheme.labelMedium?.copyWith(
        color: isDark
            ? colorScheme.onSurfaceVariant
            : colorScheme.onSurface.withValues(alpha: 0.6),
      ),

      // Error styling
      errorStyle: AppTextThemes.baseTextTheme.labelMedium?.copyWith(
        color: colorScheme.error,
      ),

      // Counter styling
      counterStyle: AppTextThemes.baseTextTheme.labelMedium?.copyWith(
        color: isDark
            ? colorScheme.onSurfaceVariant
            : colorScheme.onSurface.withValues(alpha: 0.6),
      ),

      // Label styling
      labelStyle: AppTextThemes.baseTextTheme.labelMedium?.copyWith(
        color: isDark
            ? colorScheme.onSurfaceVariant
            : colorScheme.onSurface.withValues(alpha: 0.6),
      ),

      // Content padding
      contentPadding: EdgeInsets.symmetric(
        vertical: AppPaddings.padding24.h,
        horizontal: AppPaddings.padding16.w,
      ),

      // Icon colors
      prefixIconColor: colorScheme.primary,
      suffixIconColor: colorScheme.primary,
    );
  }
}
