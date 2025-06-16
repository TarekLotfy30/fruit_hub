import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import '../widgets/splash_view_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    developer.log(
      'SplashScreen: Building splash screen widget',
      name: 'UI.SplashScreen',
      level: 800, // Info level
    );
    return const Scaffold(body: SplashViewBody());
  }
}
