import 'package:flutter/material.dart';

/// A utility class to manage font weights used in the Flutter app.
/// This class provides predefined [FontWeight] constants
/// for consistent typography
/// across the app, such as thin, regular, bold, etc.
/// It is designed as a singleton
/// with a private constructor to prevent instantiation, ensuring static access.
/// Font weight constants, defined as immutable [FontWeight] values for type
///  safety.
abstract final class AppFontWeight {
  static const FontWeight thin = FontWeight.w100;

  static const FontWeight extraLight = FontWeight.w200;

  static const FontWeight light = FontWeight.w300;

  static const FontWeight regular = FontWeight.w400;

  static const FontWeight medium = FontWeight.w500;

  static const FontWeight semiBold = FontWeight.w600;

  static const FontWeight bold = FontWeight.w700;

  static const FontWeight extraBold = FontWeight.w800;

  static const FontWeight black = FontWeight.w900;
}
