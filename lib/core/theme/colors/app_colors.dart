import 'package:flutter/material.dart';

/// A utility class that provides standardized colors for the application
/// This class cannot be instantiated and serves as a central repository
/// of color constants used throughout the application. Colors are organized
/// by their functional categories (primary, secondary, neutral, status).

// green500 => buttons and page indicator , fab el backgroun beta3ha , icons

class AppColors {
  const AppColors._();

  // ========== GRAYSCALE PALETTE ==========
  static const Color grayscale50 = Color(0xFFF2F3F3);
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
  static const Color green800 = Color(0xFF225610);
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
  static const Color green1_500 = Color(0xFF1B5E37); // Primary green1
  static const Color green1_600 = Color(0xFF2D9F5D);
  static const Color green1_700 = Color(0xFF227745);
  static const Color green1_800 = Color(0xFF174F2E);
  static const Color green1_900 = Color(0xFF0B2817);

  // ========== SEMANTIC COLORS ==========
  static const Color primary = green1_500; // Primary brand color
  static const Color secondary = orange500; // Secondary brand color
  static const Color accent = green1_600; // Accent color

  static const Color success = green600;
  static const Color warning = orange600;
  static const Color error = Color(0xFFE53E3E);
  static const Color info = Color(0xFF3182CE);

  // ========== NEUTRAL COLORS ==========
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF0C0D0D);
  static const Color background = white;
  static const Color surface = white;
  static const Color border = grayscale300;
  static const Color divider = grayscale200;

  // ========== TEXT COLORS ==========
  static const Color textPrimary = black;
  static const Color textSecondary = grayscale600;
  static const Color textTertiary = grayscale500;
  static const Color textDisabled = grayscale400;
  static const Color textOnPrimary = white;
  static const Color textOnSecondary = white;

  // ========== ICON COLORS ==========
  static const Color iconPrimary = black;
  static const Color iconSecondary = grayscale600;
  static const Color iconTertiary = grayscale500;
  static const Color iconDisabled = grayscale400;
  static const Color iconOnPrimary = white;
  static const Color iconOnSecondary = white;

}
