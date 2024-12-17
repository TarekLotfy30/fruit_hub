part of 'onboarding_view_body.dart';

class _OnboardingIndicator extends StatelessWidget {
  const _OnboardingIndicator({
    super.key,
    required this.onboardingCubit,
  });

  final OnboardingCubit onboardingCubit;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: onboardingCubit.boardController,
      count: onboardingCubit.onboardingPages.length,
      effect: WormEffect(
        spacing: 11,
        radius: 11,
        dotWidth: 16,
        dotHeight: 16,
        dotColor: onboardingCubit.cubitIndex == 1
            ? AppColors.primaryColor
            : AppColors.primaryColor.withOpacity(0.4),
        activeDotColor: AppColors.primaryColor,
      ),
    );
  }
}
