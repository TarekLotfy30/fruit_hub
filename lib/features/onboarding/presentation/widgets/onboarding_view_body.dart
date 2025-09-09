part of '../screens/onboarding_view.dart';

class _OnboardingViewBody extends StatefulWidget {
  const _OnboardingViewBody();

  @override
  State<_OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<_OnboardingViewBody> {
  late PageController _pageController;
  int _rebuildCount = 0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      keepPage: true, // Maintain page state during rebuilds
      viewportFraction: 1,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('Build _OnboardingViewBody', name: '_OnboardingViewBody');
    log('Rebuild count: $_rebuildCount', name: '_OnboardingViewBody');
    _rebuildCount++;
    return Column(
      children: [
        // Main PageView - handles scrolling between pages & Skip Button
        Expanded(child: _BuildPageView(_pageController)),
        // Page indicator - shows current page progress
        _BuildPageIndicator(_pageController),
        verticalSpacing(Spacing.spacing32),
        // Action button - Start button based on current page
        Padding(
          padding: EdgeInsets.all(AppPaddings.padding20.w),
          child: const _BuildActionButton(),
        ),
        verticalSpacing(Spacing.spacing8),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
