import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/constants/app_constant.dart';

import 'onboarding_content.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late final PageController _controller;

  @override
  Future<void> initState() async {
    super.initState();
    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersive,
      overlays: [],
    );
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // const Align(alignment: Alignment.topRight, child: Text('Skip')),
          Expanded(
            flex: 1,
            child: PageView.builder(
              controller: _controller,
              itemCount: AppConstant.onboardingItems.length,
              itemBuilder: (context, index) => OnboardingContent(
                item: AppConstant.onboardingItems[index],
                controller: _controller,
              ),
              physics: const BouncingScrollPhysics(),
            ),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: AppConstant.onboardingItems.length,
            axisDirection: Axis.horizontal,
            effect: WormEffect(
              dotWidth: 11,
              dotHeight: 11,
              dotColor: Theme.of(context).colorScheme.error,
              // ?
              // : Theme.of(context).colorScheme.primary,
              activeDotColor: Theme.of(context).colorScheme.primary,
            ),
            onDotClicked: (index) => _controller.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
          ),
        ],
      ),
    );
  }
}
