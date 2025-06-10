import 'package:flutter/material.dart';

abstract final class AppDividerTheme {
  AppDividerTheme._();
  static DividerThemeData buildDividerTheme(ColorScheme colorScheme) {
    return DividerThemeData(
      color: colorScheme.outlineVariant,
      thickness: 1,
      space: 1,
    );
  }
}
