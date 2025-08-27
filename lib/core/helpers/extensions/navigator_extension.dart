// The BC extension for accessing Navigator, perform to navigate between differ
//  screens of our application. This can be useful for changing screens after a
//  user action.

/// Extension on BuildContext to provide easy access to commonly used values.
/// This approach maintains performance while reducing code duplication.
///
/// Usage: context.appLocale, context.isLTR, context.appTheme
library;

import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  NavigatorState get navigator => Navigator.of(this);
}

// Extension usage
// context.navigator.push(
//   MaterialPageRoute(builder: (context) => ProductDetail(product)),
// );
