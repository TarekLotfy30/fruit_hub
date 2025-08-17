part of '../screens/onboarding_view.dart';

class _BuildPageIndicator extends StatelessWidget {
  const _BuildPageIndicator({
    required this.cubit,
    required this.onboardingItems,
    required this.theme,
  });

  final OnboardingCubit cubit;
  final List<OnboardingModel> onboardingItems;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return SmoothPageIndicator(
          controller: cubit.pageController,
          count: onboardingItems.length,
          axisDirection: Axis.horizontal,
          effect: WormEffect(
            dotWidth: 11,
            dotHeight: 11,
            dotColor: state is OnboardingChanged
                ? theme.colorScheme.primary
                : theme.colorScheme.primary.withValues(alpha: 0.4),
            activeDotColor: theme.colorScheme.primary,
            spacing: Spacing.spacing11.w,
          ),
        );
      },
    );
  }
}
