import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_border_width.dart';
import '../../constants/app_corners.dart';
import '../../constants/app_padding.dart';
import '../../utils/colors/app_colors.dart';
import '../text_themes/app_text_themes.dart';

abstract final class AppInputTheme {
  AppInputTheme._();

  static InputDecorationTheme inputDecorationTheme(
    ColorScheme colorScheme, {
    required bool isDark,
  }) {
    return InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: isDark
          ? colorScheme.surfaceContainerHighest
          : AppColors.grayscale50.withValues(alpha: 0.5),

      // Default border (unfocused, enabled)
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCorners.smallBorderRadius.r),
        borderSide: BorderSide(
          color: colorScheme.outline.withValues(alpha: 0.5),
          width: AppBorderWidth.defaultBorderWidth.w,
        ),
      ),

      // Enabled border
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCorners.smallBorderRadius.r),
        borderSide: BorderSide(
          color: colorScheme.outline.withValues(alpha: 0.5),
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
      hintStyle: AppTextThemes.textTheme.labelMedium?.copyWith(
        color: isDark
            ? colorScheme.onSurfaceVariant
            : colorScheme.onSurface.withValues(alpha: 0.6),
      ),

      // Helper styling
      helperStyle: AppTextThemes.textTheme.labelMedium?.copyWith(
        color: isDark
            ? colorScheme.onSurfaceVariant
            : colorScheme.onSurface.withValues(alpha: 0.6),
      ),

      // Error styling
      errorStyle: AppTextThemes.textTheme.bodyMedium?.copyWith(
        color: colorScheme.error,
      ),

      // Counter styling
      counterStyle: AppTextThemes.textTheme.labelMedium?.copyWith(
        color: isDark
            ? colorScheme.onSurfaceVariant
            : colorScheme.onSurface.withValues(alpha: 0.6),
      ),

      // Label styling
      labelStyle: AppTextThemes.textTheme.labelLarge?.copyWith(
        color: isDark
            ? colorScheme.onSurfaceVariant
            : colorScheme.onSurface.withValues(alpha: 0.6),
      ),

      //Content padding
      contentPadding: EdgeInsets.symmetric(
        vertical: AppPaddings.padding16.h,
        horizontal: AppPaddings.padding24.w,
      ),

      // Icon colors
      prefixIconColor: colorScheme.primary,  
      suffixIconColor: colorScheme.outlineVariant,
      iconColor: isDark
          ? colorScheme.onSurfaceVariant
          : colorScheme.onSurface.withValues(alpha: 0.6),
    );
  }
}
