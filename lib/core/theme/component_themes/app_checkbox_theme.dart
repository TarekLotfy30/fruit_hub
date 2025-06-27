import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';

abstract final class AppCheckBoxTheme {
  AppCheckBoxTheme._();

  static CheckboxThemeData buildRadioTheme(ColorScheme colorScheme) {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.green600;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(Colors.white),
    );
  }
}
