// ============================================================================
// PROGRESS INDICATOR THEME
// ============================================================================
import 'package:flutter/material.dart';

abstract final class AppListTileTheme {
  AppListTileTheme._();

  static ListTileThemeData listTileTheme(ColorScheme colorScheme) {
    return const ListTileThemeData(
      // textColor: WidgetStateColor.fromMap({
      //   WidgetState.disabled: Colors.pinkAccent,
      //   WidgetState.any: Colors.blue,
      // }),
      // iconColor: WidgetStateColor.fromMap({
      //   WidgetState.disabled: Colors.pinkAccent,
      //   WidgetState.any: Colors.blue,
      // }),
      // minLeadingWidth: 40, // Adjust the minimum leading width as needed
      // contentPadding: EdgeInsets.symmetric(horizontal: 16),
      // titleAlignment:
      //     ListTileTitleAlignment.titleHeight, // Center the title vertically
    );
  }
}
