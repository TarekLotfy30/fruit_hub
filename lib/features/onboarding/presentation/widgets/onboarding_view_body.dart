part of '../screens/onboarding_view.dart';

class _OnboardingViewBody extends StatelessWidget {
  const _OnboardingViewBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main PageView - handles scrolling between pages & Skip Button
        const Expanded(child: _BuildPageView()),
        // Page indicator - shows current page progress
        const _BuildPageIndicator(),
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
}
