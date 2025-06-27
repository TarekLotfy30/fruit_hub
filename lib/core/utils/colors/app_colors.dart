import 'package:flutter/material.dart';

/// A utility class that provides standardized colors for the application
/// This class cannot be instantiated and serves as a central repository
/// of color constants used throughout the application. Colors are organized
/// by their functional categories (primary, secondary, neutral, status).

// green500 => buttons and page indicator , fab el background beta3ha , icons

class AppColors {
  const AppColors._();

  // ========== GRAYSCALE PALETTE ==========
  static const Color grayscale50 = Color(0xFFF3F5F7);
  static const Color grayscale100 = Color(0xFFE4E6E7);
  static const Color grayscale200 = Color(0xFFCACECE);
  static const Color grayscale300 = Color(0xFFAFB5B6);
  static const Color grayscale400 = Color(0xFF949D9E);
  static const Color grayscale500 = Color(0xFF4E5556);
  static const Color grayscale600 = Color(0xFF616A6B);
  static const Color grayscale700 = Color(0xFF494F50);
  static const Color grayscale800 = Color(0xFF313535);
  static const Color grayscale900 = Color(0xFF181A1B);

  // ========== GREEN PALETTE ==========
  static const Color green50 = Color(0xFFEEFBEA); // Light green tint
  static const Color green100 = Color(0xFFDDF7D4);
  static const Color green200 = Color(0xFFBBEFA9);
  static const Color green300 = Color(0xFF98E77E);
  static const Color green400 = Color(0xFF76DF53);
  static const Color green500 = Color(0xFF6CDC46); // Primary green
  static const Color green600 = Color(0xFF43AC20);
  static const Color green700 = Color(0xFF328118);
  static const Color green800 = Color(0xFF217242);
  static const Color green900 = Color(0xFF112B08);

  // ========== ORANGE PALETTE ==========
  static const Color orange50 = Color(0xFFFEF6E7); // Light orange tint
  static const Color orange100 = Color(0xFFFDECCE);
  static const Color orange200 = Color(0xFFFADA9E);
  static const Color orange300 = Color(0xFFF8C76D);
  static const Color orange400 = Color(0xFFF5B53D);
  static const Color orange500 = Color(0xFFF4A91F); // Primary orange
  static const Color orange600 = Color(0xFFC2820A);
  static const Color orange700 = Color(0xFF926107);
  static const Color orange800 = Color(0xFF614105);
  static const Color orange900 = Color(0xFF312002);

  // ========== GREEN1 (SECONDARY GREEN) PALETTE ==========
  static const Color green1_50 = Color(0xFFEBF9F1); // Light green1 tint
  static const Color green1_100 = Color(0xFFD7F4E3);
  static const Color green1_200 = Color(0xFFB0E8C7);
  static const Color green1_300 = Color(0xFF88DDAB);
  static const Color green1_400 = Color(0xFF60D290);
  static const Color green1_500 = Color(0xFF38C774); // Primary 1B5E37
  static const Color green1_600 = Color(0xFF2D9F5D);
  static const Color green1_700 = Color(0xFF227745);
  static const Color green1_800 = Color(0xFF174F2E);
  static const Color green1_900 = Color(0xFF0B2817);

  // ========== RED PALETTE ==========
  static const Color red50 = Color(0xFFFEF2F2);
  static const Color red100 = Color(0xFFFED7D7);
  static const Color red200 = Color(0xFFFEB2B2);
  static const Color red300 = Color(0xFFFC8181);
  static const Color red400 = Color(0xFFF56565);
  static const Color red500 = Color(0xFFE53E3E);
  static const Color red600 = Color(0xFFC53030);
  static const Color red700 = Color(0xFF9B2C2C);
  static const Color red800 = Color(0xFF742A2A);
  static const Color red900 = Color(0xFF4A1818);

  // ========== NEUTRAL COLORS ==========
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // ========== SEMANTIC COLORS ==========

  // Success colors
  static const Color success = green600;
  static const Color successLight = green100;
  static const Color successDark = green800;

  // Warning colors
  static const Color warning = orange500;
  static const Color warningLight = orange100;
  static const Color warningDark = orange800;

  // Error colors (using orange tones for consistency)
  static const Color error = red500;
  static const Color errorLight = red100;
  static const Color errorDark = red800;

  // Info colors (using green1 palette)
  static const Color info = green1_500;
  static const Color infoLight = green1_100;
  static const Color infoDark = green1_800;

  // ========== TEXT COLORS ==========
  // Light theme text colors
  static const Color textPrimary = grayscale900; // Main text - highest contrast
  static const Color textSecondary =
      grayscale700; // Secondary text - medium contrast
  static const Color textTertiary =
      grayscale500; // Tertiary text - lower contrast
  static const Color textDisabled =
      grayscale400; // Disabled text - lowest contrast

  // Dark theme text colors
  static const Color textPrimaryDark =
      grayscale100; // Main text on dark backgrounds
  static const Color textSecondaryDark =
      grayscale300; // Secondary text on dark backgrounds
  static const Color textTertiaryDark =
      grayscale400; // Tertiary text on dark backgrounds
  static const Color textDisabledDark =
      grayscale600; // Disabled text on dark backgrounds

  // Special text colors
  static const Color textOnPrimary =
      Colors.white; // Text on primary color backgrounds
  static const Color textOnSecondary =
      Colors.white; // Text on secondary color backgrounds
  static const Color textLink = green600; // Link text in light theme
  static const Color textLinkDark = green400; // Link text in dark theme
  static const Color textError = red600; // Error text in light theme
  static const Color textErrorDark = red400; // Error text in dark theme

  // Interactive States
  static const Color hover = Color(0x0A000000); // 4% black overlay
  static const Color pressed = Color(0x14000000); // 8% black overlay
  static const Color focused = Color(0x1F000000); // 12% black overlay
  static const Color disabled = grayscale300;
  static const Color disabledContent = grayscale400;

  // Surface Variants for better hierarchy
  static const Color surfaceElevated1 = Color(0xFFFFFBFF); // Cards
  static const Color surfaceElevated2 = Color(0xFFF7F2FA); // Dialogs
  static const Color surfaceElevated3 = Color(0xFFECE6F0); // Menus

  // Dark theme surface variants
  static const Color darkSurface = Color(0xFF121212);
  static const Color darkSurfaceElevated1 = Color(0xFF1E1E1E);
  static const Color darkSurfaceElevated2 = Color(0xFF232323);
  static const Color darkSurfaceElevated3 = Color(0xFF252525);
}
