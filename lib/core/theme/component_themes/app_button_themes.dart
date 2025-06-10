import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_border_width.dart';
import '../../constants/app_corners.dart';
import '../../constants/app_elevation.dart';
import '../../constants/app_padding.dart';
import '../../constants/app_sizes.dart';
import '../text_themes/base_text_theme.dart';

/// Button theme configurations for consistent button styling.
///
/// Provides theme builders for all button types used in the application:
/// - ElevatedButton: Primary actions
/// - OutlinedButton: Secondary actions
/// - FloatingActionButton: Main action button

abstract final class AppButtonThemes {
  const AppButtonThemes._();

  static ElevatedButtonThemeData buildElevatedButtonTheme(
    ColorScheme colorScheme,
  ) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: AppElevation.buttonElevation,
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppCorners.buttonBorderRadius.r, //16
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: AppPaddings.padding12.h,
          horizontal: AppPaddings.padding14.w,
        ),
        minimumSize: Size(double.maxFinite, AppSizes.buttonHeight.h),
        textStyle: AppTextTheme.baseTextTheme.titleLarge,
      ),
    );
  }

  static OutlinedButtonThemeData buildOutlinedButtonTheme(
    ColorScheme colorScheme,
  ) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.primary,
        elevation: AppElevation.buttonElevation, //0
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppCorners.buttonBorderRadius.r, //16
          ), //16
          side: BorderSide(
            color: colorScheme.primary,
            width: AppBorderWidth.defaultBorderWidth.w, //1
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: AppPaddings.padding8.h),
        minimumSize: Size(double.maxFinite, AppSizes.buttonHeight.h),
        textStyle: AppTextTheme.baseTextTheme.titleLarge?.copyWith(
          color: colorScheme.primary,
        ),
      ),
    );
  }

  static FloatingActionButtonThemeData buildFABTheme(ColorScheme colorScheme) {
    return FloatingActionButtonThemeData(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      elevation: AppElevation.fabElevation, //6
      shape: const CircleBorder(),
    );
  }
}
