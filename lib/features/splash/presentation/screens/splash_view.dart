import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/features/splash/presentation/widgets/splash_view_body.dart';

/// Root widget for the Splash screen, sets up a Scaffold with a SplashViewBody
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () async {
      context.replaceWithNamedRoute(Routes.onboardingScreen);
    });
  }
}
