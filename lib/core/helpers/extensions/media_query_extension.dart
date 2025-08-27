// The BuildContext extension to access MediaQuery is an elegant and easy way
// to obtain information about the screen size and orientation of the device.
// This can be useful for adapting the design of our application to different
// devices and screens.

import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

// Extension usage
// final mediaQuery = context.mediaQuery;
// final deviceHeight = mediaQuery.size.height;
// final deviceWidth = mediaQuery.size.width;
