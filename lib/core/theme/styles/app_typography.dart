// AppTypography class providing pre-defined text styles for the application

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_font_weight.dart';

/// A utility class to manage responsive text styles for the Flutter app.
/// This class provides predefined [TextStyle] factories
/// for consistent typography across different screen sizes,
/// with responsive font sizes, weights, and colors. It is designed as a
/// singleton with a private constructor to prevent instantiation.

class AppTypography {
  const AppTypography._();

  static final displaySmall = TextStyle(
    fontSize: 23.sp,
    fontWeight: AppFontWeight.bold,
  );

  static final titleMedium = TextStyle(
    fontSize: 22.5.sp,
    fontWeight: AppFontWeight.semiBold,
  );

  static final titleSmall = TextStyle(
    fontSize: 19.sp,
    fontWeight: AppFontWeight.semiBold,
  );

  static final bodyLarge = TextStyle(
    fontSize: 16.sp,
    fontWeight: AppFontWeight.regular,
  );

  static final bodyMedium = TextStyle(
    fontSize: 15.sp,
    fontWeight: AppFontWeight.regular,
  );
  static final labelLarge = TextStyle(
    fontSize: 14.sp,
    fontWeight: AppFontWeight.semiBold,
  );
  
  static final bodySmall = TextStyle(
    fontSize: 13.sp,
    fontWeight: AppFontWeight.regular,
  );

  static final labelMedium = TextStyle(
    fontSize: 11.sp,
    fontWeight: AppFontWeight.regular,
  );
}
