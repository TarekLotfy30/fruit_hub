part of '../screens/onboarding_view.dart';

class _BuildPageIndicator extends StatelessWidget {
  const _BuildPageIndicator();

  @override
  Widget build(BuildContext context) {
    final cubit = context.onboardingCubit;
    final colorSchema = context.colorScheme;
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return SmoothPageIndicator(
          controller: cubit.pageController,
          count: AppConstant.onboardingItems.length,
          axisDirection: Axis.horizontal,
          effect: WormEffect(
            dotWidth: 11,
            dotHeight: 11,
            dotColor: state is OnboardingChanged
                ? colorSchema.primary
                : colorSchema.primary.withValues(alpha: 0.4),
            activeDotColor: colorSchema.primary,
            spacing: Spacing.spacing11.w,
          ),
        );
      },
    );
  }
}
