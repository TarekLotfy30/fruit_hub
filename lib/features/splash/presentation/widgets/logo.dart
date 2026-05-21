import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';

/// Animated app logo centered on screen.
class Logo extends StatelessWidget {
  const Logo({super.key, required this.opacity, required this.scale});

  final Animation<double> opacity;
  final Animation<double> scale;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: opacity,
        child: ScaleTransition(
          scale: scale,
          child: Semantics(
            label: 'FruitHub — loading',
            child: SvgPicture.asset(AppAssets.fruitHubLogo, width: 180),
          ),
        ),
      ),
    );
  }
}
