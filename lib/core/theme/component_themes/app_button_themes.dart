import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_border_width.dart';
import '../../constants/app_corners.dart';
import '../../constants/app_elevation.dart';
import '../../constants/app_padding.dart';
import '../../constants/app_sizes.dart';
import '../../utils/styles/app_fonts_family.dart';
import '../text_themes/base_text_theme.dart';

/// Button theme configurations for consistent button styling.
///
/// Provides theme builders for all button types used in the application:
/// - ElevatedButton: Primary actions (uses primary color)
/// - OutlinedButton: Secondary actions (uses secondary color)
/// - FloatingActionButton: Main action button (uses tertiary color for the bright green)
/// - TextButton: Tertiary actions

abstract final class AppButtonThemes {
  const AppButtonThemes._();

  static ElevatedButtonThemeData buildElevatedButtonTheme(
    ColorScheme colorScheme,
  ) {
    return ElevatedButtonThemeData(
      style:
          ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            elevation: AppElevation.buttonElevation,
            shadowColor: colorScheme.shadow,
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppCorners.buttonBorderRadius.r, //16
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: AppPaddings.padding12.h,
              //horizontal: AppPaddings.padding14.w,
            ),
            minimumSize: Size(double.maxFinite, AppSizes.buttonHeight.h), //48
            textStyle: AppTextThemes.baseTextTheme.titleLarge?.copyWith(
              fontFamily: AppFontFamily.cairo,
            ),
          ).copyWith(
            // Add interaction states
            // backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            //   if (states.contains(WidgetState.pressed)) {
            //     return colorScheme.primary.withValues(alpha: 0.12);
            //   }
            //   if (states.contains(WidgetState.hovered)) {
            //     return colorScheme.primary.withValues(alpha: 0.08);
            //   }
            //   return colorScheme.primary;
            // }),
          ),
    );
  }

  static OutlinedButtonThemeData buildOutlinedButtonTheme(
    ColorScheme colorScheme,
  ) {
    return OutlinedButtonThemeData(
      style:
          OutlinedButton.styleFrom(
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
            padding: EdgeInsets.symmetric(
              vertical: AppPaddings.padding8.h,
              horizontal: AppPaddings.padding14.w,
            ),
            minimumSize: Size(double.maxFinite, AppSizes.buttonHeight.h),
            textStyle: AppTextThemes.baseTextTheme.titleLarge?.copyWith(
              fontFamily: AppFontFamily.cairo,
            ),
          ).copyWith(
            // Add interaction states
            backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (states.contains(WidgetState.pressed)) {
                return colorScheme.primary.withValues(alpha: 0.12);
              }
              if (states.contains(WidgetState.hovered)) {
                return colorScheme.primary.withValues(alpha: 0.08);
              }
              return colorScheme.surface;
            }),
            foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (states.contains(WidgetState.pressed)) {
                return colorScheme.primary.withValues(alpha: 0.12);
              }
              if (states.contains(WidgetState.hovered)) {
                return colorScheme.primary.withValues(alpha: 0.08);
              }
              return colorScheme.primary;
            }),
            side: WidgetStateProperty.resolveWith<BorderSide>((states) {
              if (states.contains(WidgetState.pressed)) {
                return BorderSide(
                  color: colorScheme.primary.withValues(alpha: 0.12),
                  width: AppBorderWidth.defaultBorderWidth.w,
                );
              }
              if (states.contains(WidgetState.hovered)) {
                return BorderSide(
                  color: colorScheme.primary.withValues(alpha: 0.08),
                  width: AppBorderWidth.defaultBorderWidth.w,
                );
              }
              return BorderSide(
                color: colorScheme.primary,
                width: AppBorderWidth.defaultBorderWidth.w,
              );
            }),
          ),
    );
  }

  static FloatingActionButtonThemeData buildFABTheme(ColorScheme colorScheme) {
    return FloatingActionButtonThemeData(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      elevation: AppElevation.fabElevation, //6
      focusElevation: AppElevation.fabElevation + 2,
      hoverElevation: AppElevation.fabElevation + 2,
      highlightElevation: AppElevation.fabElevation + 4,
      shape: const CircleBorder(),
    );
  }

  static TextButtonThemeData buildTextButtonTheme(ColorScheme colorScheme) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: colorScheme.primary,
        elevation: AppElevation.buttonElevation,
        padding: EdgeInsets.symmetric(
          vertical: AppPaddings.padding12.h,
          horizontal: AppPaddings.padding14.w,
        ),
        alignment: Alignment.center,
        visualDensity: VisualDensity.standard,
        enableFeedback: true,
        textStyle: AppTextThemes.baseTextTheme.labelSmall?.copyWith(
          fontFamily: AppFontFamily.cairo,
        ),
      ),
    );
  }
}
