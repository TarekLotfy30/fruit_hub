part of '../screens/onboarding_view.dart';

class _OnboardingViewBody extends StatelessWidget {
  const _OnboardingViewBody();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();
    final onboardingItems = AppConstant.onboardingItems;
    final theme = Theme.of(context);
    return Column(
      children: [
        // Main PageView - handles scrolling between pages & Skip Button
        Expanded(
          child: _BuildPageView(
            cubit: cubit,
            onboardingItems: onboardingItems,
            theme: theme,
          ),
        ),

        // Page indicator - shows current page progress
        _BuildPageIndicator(
          cubit: cubit,
          onboardingItems: onboardingItems,
          theme: theme,
        ),

        verticalSpacing(Spacing.spacing32),

        // Action button - Start button based on current page
        Padding(
          padding: EdgeInsets.all(AppPaddings.padding20.w),
          child: _BuildActionButton(cubit: cubit),
        ),

        verticalSpacing(Spacing.spacing8),
      ],
    );
  }
}
