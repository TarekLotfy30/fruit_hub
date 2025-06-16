import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_durations.dart';
import '../../../../core/helpers/functions/app_navigation.dart';
import '../../../../core/routing/routes_name.dart';
import '../../../../core/widgets/build_optimized_svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // 1. AWAIT the async work (delay, data loading, etc.)
    await Future.delayed(AppDurations.slowAnimationDuration);

    // Add haptic feedback for better UX
    await HapticFeedback.lightImpact();
    // 2. CHECK if the widget is still mounted AFTER the await
    if (!mounted) {
      return;
    }

    // 3. USE the context safely
    Navigation.pushReplacement(context, RoutesName.onboardingScreen);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FadeInDown(
            child: const Align(
              alignment: Alignment.topLeft,
              child: BuildOptimizedSvg(
                assetPath: AppAssets.leaves,
                semanticLabel: 'Leaves',
              ),
            ),
          ),
          FadeIn(
            child: const BuildOptimizedSvg(
              assetPath: AppAssets.fruitHubLogo,
              semanticLabel: 'Fruit Hub',
            ),
          ),
          FadeInUp(
            child: const BuildOptimizedSvg(
              assetPath: AppAssets.circles,
              semanticLabel: 'Circles',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
