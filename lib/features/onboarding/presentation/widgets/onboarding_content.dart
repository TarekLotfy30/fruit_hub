import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/constants/app_constant.dart';
import '../../../../core/helpers/functions/app_spacing.dart';
import '../../../../core/widgets/build_optimized_svg.dart';
import '../../data/models/onboarding_model.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.item,
    required this.controller,
  });

  final OnboardingModel item;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 325.h,
          child: Stack(
            children: [
              Positioned.fill(
                child: BuildOptimizedSvg(
                  assetPath: item.backgroundImage,
                  semanticLabel: 'Background Color',
                  fit: BoxFit.fill,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BuildOptimizedSvg(
                  assetPath: item.image,
                  semanticLabel: 'image',
                ),
              ),
            ],
          ),
        ),
        verticalSpacing(64),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // title
            Visibility(
              visible: item.isLast,
              replacement: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: item.titleTextSpan1,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    TextSpan(
                      text: item.titleTextSpan2,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    TextSpan(
                      text: item.titleTextSpan3,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              child: Text(
                item.title ?? '',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            verticalSpacing(24),
            // subtitle
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 37.w),
              child: Text(
                item.subTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
