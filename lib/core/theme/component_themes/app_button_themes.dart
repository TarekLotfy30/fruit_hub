import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_border_width.dart';
import '../../constants/app_corners.dart';
import '../../constants/app_elevation.dart';
import '../../constants/app_padding.dart';
import '../../constants/app_sizes.dart';
import '../../utils/styles/app_fonts_family.dart';
import '../text_themes/app_text_themes.dart';

/// Button theme configurations for consistent button styling.
///
/// Provides theme builders for all button types used in the application:
/// - ElevatedButton: Primary actions (uses primary color)
/// - OutlinedButton: Secondary actions (uses secondary color)
/// - FloatingActionButton: Main action button (uses tertiary color for the bright green)
/// - TextButton: Tertiary actions

abstract final class AppButtonThemes {
  const AppButtonThemes._();

  static ElevatedButtonThemeData elevatedButtonTheme(ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
      style:
          ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            elevation: AppElevation.buttonElevation,
            shadowColor: colorScheme.shadow,
            surfaceTintColor: colorScheme.primary,
            overlayColor: colorScheme.primary.withValues(alpha: 0.12),
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppCorners.buttonBorderRadius.r, //16
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: AppPaddings.padding12.h),
            minimumSize: Size(double.maxFinite, AppSizes.buttonHeight.h), //48
            textStyle: AppTextThemes.textTheme.titleLarge?.copyWith(
              fontFamily: AppFontFamily.cairo,
            ),
          ).copyWith(
            backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (states.contains(WidgetState.disabled)) {
                return colorScheme.outline.withValues(alpha: 0.12);
              }
              if (states.contains(WidgetState.pressed)) {
                return colorScheme.primary.withValues(
                  alpha: 0.88,
                ); // Less dramatic change
              }

              return colorScheme.primary;
            }),
            foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (states.contains(WidgetState.disabled)) {
                return colorScheme.outline.withValues(alpha: 0.38);
              }
              return colorScheme.onPrimary;
            }),
            overlayColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (states.contains(WidgetState.pressed)) {
                return colorScheme.onPrimary.withValues(alpha: 0.12);
              }
              if (states.contains(WidgetState.hovered)) {
                return colorScheme.onPrimary.withValues(alpha: 0.08);
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.onPrimary.withValues(alpha: 0.12);
              }
              return Colors.transparent;
            }),
            elevation: WidgetStateProperty.resolveWith<double>((states) {
              if (states.contains(WidgetState.disabled)) {
                return 0;
              }
              if (states.contains(WidgetState.pressed)) {
                return AppElevation.buttonElevation -
                    1; // Slightly less elevation when pressed
              }
              if (states.contains(WidgetState.hovered)) {
                return AppElevation.buttonElevation +
                    1; // Slightly more elevation on hover
              }
              return AppElevation.buttonElevation;
            }),
          ),
    );
  }

  static OutlinedButtonThemeData outlinedButtonTheme(ColorScheme colorScheme) {
    return OutlinedButtonThemeData(
      style:
          OutlinedButton.styleFrom(
            backgroundColor: colorScheme.surface,
            foregroundColor: colorScheme.onSurface,
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
            textStyle: AppTextThemes.textTheme.titleMedium?.copyWith(
              fontFamily: AppFontFamily.cairo,
            ),
          ).copyWith(
            // Add interaction states
            backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (states.contains(WidgetState.pressed)) {
                return colorScheme.primary.withValues(alpha: 0.12);
              }
              return colorScheme.surface;
            }),
            foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (states.contains(WidgetState.pressed)) {
                return colorScheme.onSurface.withValues(alpha: 0.12);
              }
              return colorScheme.onSurface;
            }),
            side: WidgetStateProperty.resolveWith<BorderSide>((states) {
              if (states.contains(WidgetState.pressed)) {
                return BorderSide(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.12),
                  width: AppBorderWidth.defaultBorderWidth.w,
                );
              }
              return BorderSide(
                color: colorScheme.outlineVariant.withValues(alpha: 0.38),
                width: AppBorderWidth.defaultBorderWidth.w,
              );
            }),
          ),
    );
  }

  static FloatingActionButtonThemeData fabTheme(ColorScheme colorScheme) {
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

  static TextButtonThemeData textButtonTheme(ColorScheme colorScheme) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.primary,
        elevation: AppElevation.buttonElevation,
        alignment: Alignment.center,
        textStyle: AppTextThemes.textTheme.labelSmall?.copyWith(
          fontFamily: AppFontFamily.cairo,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
