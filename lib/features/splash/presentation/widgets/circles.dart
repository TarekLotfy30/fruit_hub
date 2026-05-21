import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';

/// Animated decorative circles at the bottom of the screen.
class Circles extends StatelessWidget {
  const Circles({super.key, required this.opacity});

  final Animation<double> opacity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: FadeTransition(
        opacity: opacity,
        child: ExcludeSemantics(
          child: SvgPicture.asset(AppAssets.circles, fit: BoxFit.fitWidth),
        ),
      ),
    );
  }
}
