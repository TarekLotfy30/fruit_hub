import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../constants/app_sizes.dart';
import '../helpers/extensions/theme_extension.dart';

class BuildLoadingAnimation extends StatelessWidget {
  const BuildLoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.inkDrop(
      color: context.colorScheme.inversePrimary,
      size: AppSizes.loadingAnimationSize,
    );
  }
}
