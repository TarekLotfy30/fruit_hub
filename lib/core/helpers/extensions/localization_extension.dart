import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension AppLocalizationExtensions on BuildContext {
  /// Gets the current locale with caching optimization.
  Locale get appLocale => locale;

  /// Determines if the current locale is Left-to-Right.
  bool get isLTR => locale.languageCode == 'en';

  /// Determines if the current locale is Right-to-Left.
  bool get isRTL => !isLTR;
}
