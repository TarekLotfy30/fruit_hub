import 'package:flutter/material.dart';

abstract final class ThemeConstants {
  const ThemeConstants._();

  // ========================================
  // CONSTANTS AND SHARED CONFIGURATIONS
  // ========================================

  /// Standard page transitions for consistent navigation across platforms
  static const PageTransitionsTheme pageTransitionsTheme = PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
    },
  );

  /// Visual density configuration for adaptive platform behavior
  static final VisualDensity visualDensity =
      VisualDensity.adaptivePlatformDensity;
}
