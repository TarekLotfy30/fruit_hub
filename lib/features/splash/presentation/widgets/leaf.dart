import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';

/// Animated leaf decoration in the top-left corner.
class Leaf extends StatelessWidget {
  const Leaf({super.key, required this.animation});

  final Animation<Offset> animation;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: SlideTransition(
        position: animation,
        child: SvgPicture.asset(
          AppAssets.leaves,
          width: 180,
          excludeFromSemantics: true,
        ),
      ),
    );
  }
}
