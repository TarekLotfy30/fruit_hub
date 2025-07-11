import 'package:flutter/material.dart';

abstract final class AppIcons {
  // If using Flutter built-in icons
  static const IconData email = Icons.email_outlined;
  static const IconData password = Icons.lock_outline;
  static const IconData visibility = Icons.visibility_outlined;
  static const IconData visibilityOff = Icons.visibility_off_outlined;
  static const IconData error = Icons.error_outline;
  static const IconData success = Icons.check_circle_outline;

  // If using custom SVG or PNG icons
  static const String leftArrow = 'assets/svgs/icons/left_arrow.svg';
  static const String google = 'assets/svgs/icons/google.svg';
  static const String apple = 'assets/svgs/icons/apple.svg';
  static const String twitter = 'assets/svgs/icons/apple_dark.svg';
  static const String facebook = 'assets/svgs/icons/facebook.svg';
}
