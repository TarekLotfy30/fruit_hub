import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Creates a vertical space with the specified height, adjusted for screen size
///
/// @param height The height in logical pixels
/// @return A SizedBox with the specified height
/// Returns a vertical spacing box with [height].

SizedBox verticalSpacing(double height) {
  assert(height >= 0, 'Height must be non-negative');
  return SizedBox(height: height.h);
}

/// Creates a horizontal space with the specified width,
///  adjusted for screen size
///
/// @param width The width in logical pixels
/// @return A SizedBox with the specified width
/// Returns a horizontal spacing box with [width].

SizedBox horizontalSpacing(double width) {
  assert(width >= 0, 'Width must be non-negative');
  return SizedBox(width: width.w);
}
