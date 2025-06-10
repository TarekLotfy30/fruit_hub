import 'package:flutter/material.dart';

class AppAnimations {
  const AppAnimations._();

  /// Animation curve for most UI transitions
  static const Curve standardAnimationCurve = Curves.easeInOut;

  /// Animation curve for entrance animations
  static const Curve entranceAnimationCurve = Curves.easeOut;

  /// Animation curve for exit animations
  static const Curve exitAnimationCurve = Curves.easeIn;
}
