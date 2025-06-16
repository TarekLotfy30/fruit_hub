import 'package:flutter/material.dart';

abstract final class AppDialogTheme {
  AppDialogTheme._();
  static DialogTheme buildDialogTheme(ColorScheme colorScheme) {
    return DialogTheme(
      elevation: 8,
      //backgroundColor: AppColors.surfaceElevated2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      //titleTextStyle: AppTypography.lightTextTheme.headlineSmall,
      //contentTextStyle: AppTypography.lightTextTheme.bodyMedium,
    );
  }
}
