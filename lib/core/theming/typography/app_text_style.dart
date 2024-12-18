// AppTypography class providing pre-defined text styles for the application

import 'package:flutter/material.dart';

import 'font_weight_helper.dart';

class AppTextStyles {
  /*static const textStyle33 = TextStyle(
    fontSize: 33,
    fontWeight: FontWeight.w900,
    //fontFamily: kGtSectraFine,
    letterSpacing: 1.2,
  ); */
  const AppTextStyles._();

  static const textStyle48 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeightHelper.regular,
  );

  static const textStyle40 = TextStyle(
    fontSize: 40,
    fontWeight: FontWeightHelper.regular,
  );

  static const textStyle33 = TextStyle(
    fontSize: 33,
    fontWeight: FontWeightHelper.regular,
  );

  static const textStyle28 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeightHelper.regular,
  );

  static const textStyle23 = TextStyle(
    fontSize: 23,
    fontWeight: FontWeightHelper.bold,
  );

  static const textStyle19 = TextStyle(
    fontSize: 19,
    fontWeight: FontWeightHelper.semiBold,
  );

  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.medium,
  );

  static const textStyle13 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeightHelper.regular,
  );

  static const textStyle11 = TextStyle(
    fontSize: 11,
    fontWeight: FontWeightHelper.regular,
  );
}
