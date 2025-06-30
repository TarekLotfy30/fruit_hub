import 'package:flutter/material.dart';

abstract final class AppChipTheme {
  AppChipTheme._();
  static ChipThemeData chipTheme(ColorScheme colorScheme) {
    return ChipThemeData(
      //backgroundColor: colorScheme.surface,
      //selectedColor: colorScheme.primary.withOpacity(0.12),
      //labelStyle: AppTypography.lightTextTheme.labelMedium,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
