import 'package:flutter/material.dart';

abstract final class AppIcons {
  // If using Flutter built-in icons
  static const IconData email = Icons.email_outlined;
  static const IconData password = Icons.lock_outline;
  static const IconData visibility = Icons.visibility_outlined;
  static const IconData visibilityOff = Icons.visibility_off_outlined;
  static const IconData error = Icons.error_outline_outlined;
  static const IconData success = Icons.check_circle_outline;
  static const IconData warning = Icons.warning_amber_outlined;
  static const IconData info = Icons.info_outline;
  static const IconData user = Icons.person_outline;

  // If using custom SVG or PNG icons
  static const String leftArrow = 'assets/svgs/shared_icons/left_arrow.svg';
  static const String rightArrow = 'assets/svgs/shared_icons/right_arrow.svg';
  static const String google = 'assets/svgs/auth/google.svg';
  static const String apple = 'assets/svgs/auth/apple.svg';
  static const String twitter = 'assets/svgs/auth/apple_dark.svg';
  static const String facebook = 'assets/svgs/auth/facebook.svg';

  /// Home icons
  static const String notification = 'assets/svgs/home/notification.svg';
}
