// AppTypography class providing pre-defined text styles for the application

import 'package:flutter/material.dart';

import 'font_weight_helper.dart';

abstract class AppStyles {
  static const String _fontFamily = 'Cairo';

  /*static const textStyle33 = TextStyle(
    fontSize: 33,
    fontWeight: FontWeight.w900,
    //fontFamily: kGtSectraFine,
    letterSpacing: 1.2,
  ); */

  static const textStyle48 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeightHelper.regular,
    fontFamily: _fontFamily,
  );

  static const textStyle40 = TextStyle(
    fontSize: 40,
    fontWeight: FontWeightHelper.regular,
    fontFamily: _fontFamily,
  );

  static const textStyle33 = TextStyle(
    fontSize: 33,
    fontWeight: FontWeightHelper.regular,
    fontFamily: _fontFamily,
  );

  static const textStyle28 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeightHelper.regular,
    fontFamily: _fontFamily,
  );

  static const textStyle23 = TextStyle(
    fontSize: 23,
    fontWeight: FontWeightHelper.bold,
    fontFamily: _fontFamily,
  );

  static const textStyle19 = TextStyle(
    fontSize: 19,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: _fontFamily,
  );

  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.medium,
    fontFamily: _fontFamily,
  );

  static const textStyle13 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeightHelper.regular,
    fontFamily: _fontFamily,
  );

  static const textStyle11 = TextStyle(
    fontSize: 11,
    fontWeight: FontWeightHelper.regular,
    fontFamily: _fontFamily,
  );
}
