import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_corners.dart';
import '../../constants/app_padding.dart';

abstract final class AppChipTheme {
  AppChipTheme._();
  static ChipThemeData chipTheme(ColorScheme colorScheme) {
    return ChipThemeData(
      //backgroundColor: colorScheme.surface,
      //selectedColor: colorScheme.primary.withOpacity(0.12),
      //labelStyle: AppTypography.lightTextTheme.labelMedium,
      padding: const EdgeInsets.symmetric(
        horizontal: AppPaddings.padding12,
        vertical: AppPaddings.padding8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppCorners.dialogBorderRadius.r),
      ),
    );
  }
}
