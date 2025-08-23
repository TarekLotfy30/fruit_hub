import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_border_width.dart';

abstract final class AppCheckBoxTheme {
  AppCheckBoxTheme._();

  static CheckboxThemeData checkboxTheme(ColorScheme colorScheme) {
    return CheckboxThemeData(
      checkColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colorScheme.surface;
        }
        return colorScheme.onPrimary;
      }),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return colorScheme.primary.withValues(alpha: 0.12);
        }
        if (states.contains(WidgetState.focused)) {
          return colorScheme.primary.withValues(alpha: 0.12);
        }
        return Colors.transparent;
      }),
      splashRadius: 24.r, // Control the splash area size
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      side: BorderSide(
        color: colorScheme.outline.withValues(alpha: 0.5),
        width: AppBorderWidth.focusedBorderWidth.w,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
