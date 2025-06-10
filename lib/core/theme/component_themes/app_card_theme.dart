import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_corners.dart';
import '../../constants/app_elevation.dart';

abstract final class AppCardTheme {
  AppCardTheme._();

  /// Creates Card theme configuration for the given color scheme
  static CardThemeData buildCardTheme(ColorScheme colorScheme) {
    return CardThemeData(
      elevation: AppElevation.appBarElevation,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppCorners.smallBorderRadius.r),
      ),
      color: colorScheme.surface,
      surfaceTintColor: colorScheme.primary,
    );
  }
}
