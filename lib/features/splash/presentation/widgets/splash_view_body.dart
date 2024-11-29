import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/images.dart';

/// Main body widget for the Splash View
/// It displays a column of SVG images representing branding elements
/// such as the fruit hub logo, tree, and circles
class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(
          AppImages.tree,
          semanticsLabel: 'tree',
          alignment: Alignment.topLeft,
        ),
        SvgPicture.asset(
          AppImages.fruitHub,
          semanticsLabel: 'fruitHub logo',
        ),
        SvgPicture.asset(
          AppImages.circles,
          semanticsLabel: 'circles',
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
