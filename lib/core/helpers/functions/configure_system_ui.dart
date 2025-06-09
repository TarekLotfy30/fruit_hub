import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Configure system UI appearance

void configureSystemUI() {
  log('Configuring system UI...');

  // Configure status bar appearance
  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
}
