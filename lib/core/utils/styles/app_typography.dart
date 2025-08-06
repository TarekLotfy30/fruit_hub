// AppTypography class providing pre-defined text styles for the application

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_font_weight.dart';

/// A utility class to manage responsive text styles for the Flutter app.
/// This class provides predefined [TextStyle] factories
/// for consistent typography across different screen sizes,
/// with responsive font sizes, weights, and colors. It is designed as a
/// singleton with a private constructor to prevent instantiation.

abstract final class AppTypography {
  const AppTypography._();

  static final textStyle23Bold = TextStyle(
    fontSize: 23.sp,
    fontWeight: AppFontWeight.bold,
  );

  static final textStyle19Bold = TextStyle(
    fontSize: 19.sp,
    fontWeight: AppFontWeight.bold,
  );

  static final textStyle16Bold = TextStyle(
    fontSize: 16.sp,
    fontWeight: AppFontWeight.bold,
  );

  static final textStyle16Semibold = TextStyle(
    fontSize: 16.sp,
    fontWeight: AppFontWeight.semiBold,
  );

  static final textStyle16Regular = TextStyle(
    fontSize: 16.sp,
    fontWeight: AppFontWeight.regular,
  );

  static final textStyle13Bold = TextStyle(
    fontSize: 13.sp,
    fontWeight: AppFontWeight.bold,
  );

  static final textStyle13regular = TextStyle(
    fontSize: 13.sp,
    fontWeight: AppFontWeight.regular,
  );

  static final textStyle13semiBold = TextStyle(
    fontSize: 13.sp,
    fontWeight: AppFontWeight.semiBold,
  );

  static final textStyle11SemiBold = TextStyle(
    fontSize: 11.sp,
    fontWeight: AppFontWeight.semiBold,
  );
}
