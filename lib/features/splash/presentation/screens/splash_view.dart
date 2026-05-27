import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_durations.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/helpers/extensions/theme_extension.dart';
import '../../../../core/helpers/functions/app_navigation.dart';
import '../../../../core/routing/app_routes_name.dart';

import '../../data/use_case/splash_use_case.dart';
import '../widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  // ── Single controller driving all three animations via Interval ──────────
  late final AnimationController _controller;

  late final Animation<double> _circlesOpacity;
  late final Animation<Offset> _leafSlide;
  late final Animation<double> _logoOpacity;
  late final Animation<double> _logoScale;

  // ── Routing use-case (injected, not hard-coupled to getIt) ───────────────
  late final GetInitialRouteUseCase _getInitialRoute;

  @override
  void initState() {
    super.initState();
    _getInitialRoute = getIt<GetInitialRouteUseCase>();

    _controller = AnimationController(
      vsync: this,
      duration: AppDurations.totalDuration,
    );

    // Circles fade-in
    _circlesOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.03, 0.13, curve: Curves.easeOut),
      ),
    );

    // Leaf slide-in
    _leafSlide =
        Tween<Offset>(
          begin: const Offset(-1.2, -1.2),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.16, 0.25, curve: Curves.easeOut),
          ),
        );

    // Logo fade-in
    _logoOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.28, 0.38, curve: Curves.easeOut),
      ),
    );

    // Logo scale-in
    _logoScale = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.28, 0.38, curve: Curves.easeOut),
      ),
    );

    _startAnimation();
  }

  /// Runs the splash animation sequence and navigates to the initial route.
  ///
  /// Every await is guarded with a [mounted] check so that early widget
  /// disposal (OS kill, deep-link redirect, fast back-tap) cannot trigger
  /// setState or controller calls on a dead State object.

  Future<void> _startAnimation() async {
    _controller.forward();

    // Hold long enough for the full animation + logo visibility period
    await Future<void>.delayed(AppDurations.totalDuration);
    if (!mounted) {
      return;
    }

    late final String route;
    try {
      route = _getInitialRoute.call();
    } on Exception catch (e, stackTrace) {
      log(
        'Failed to determine initial route — falling back to onboarding.',
        error: e,
        stackTrace: stackTrace,
        name: 'splash.routing',
        level: 1000,
      );
      route = AppRoutesName.onboardingScreen;
    }

    if (!mounted) {
      return;
    }
    await AppNavigation.navigateToAndClearStack(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: SplashViewBody(
        leafSlide: _leafSlide,
        logoOpacity: _logoOpacity,
        logoScale: _logoScale,
        circlesOpacity: _circlesOpacity,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
