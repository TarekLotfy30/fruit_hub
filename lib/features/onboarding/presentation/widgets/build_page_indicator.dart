part of '../widgets/onboarding_view_body.dart';

class _BuildPageIndicator extends StatelessWidget {
  const _BuildPageIndicator();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return PositionedDirectional(
          bottom: 126.h,
          child: SmoothPageIndicator(
            controller: context.watch<OnboardingCubit>().pageController,
            count: AppConstant.onboardingItems.length,
            axisDirection: Axis.horizontal,
            effect: WormEffect(
              dotWidth: 11,
              dotHeight: 11,
              dotColor: state is OnboardingChanged
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondaryContainer,
              activeDotColor: Theme.of(context).colorScheme.primary,
              spacing: 10.w,
            ),
          ),
        );
      },
    );
  }
}
