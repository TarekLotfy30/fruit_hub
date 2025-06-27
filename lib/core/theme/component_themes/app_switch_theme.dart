import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';

class AppSwitchTheme {
  AppSwitchTheme._();
  static SwitchThemeData buildSwitchTheme(ColorScheme colorScheme) {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.primary;
        }
        return colorScheme.outline;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.green200;
        }
        return colorScheme.outlineVariant;
      }),
    );
  }
}
