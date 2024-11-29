part of 'onboarding_view_body.dart';

class _BuildPageIndicator extends StatelessWidget {
  const _BuildPageIndicator({
    required this.onboardingCubit,
  });

  final OnboardingCubit onboardingCubit;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: onboardingCubit.boardController, // PageController
      count: onboardingCubit.onboardingPages.length,
      effect: WormEffect(
        spacing: 11,
        radius: 11,
        dotWidth: 16,
        dotHeight: 16,
        dotColor: AppColors.primaryColor.withOpacity(0.4),
        activeDotColor: AppColors.primaryColor,
      ),
      onDotClicked: (index) async {
        onboardingCubit.boardController.animateToPage(
          index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
    );
  }
}
