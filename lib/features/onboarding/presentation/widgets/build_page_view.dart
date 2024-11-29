part of 'onboarding_view_body.dart';

class _BuildPageView extends StatelessWidget {
  const _BuildPageView({
    required this.onboardingCubit,
  });

  final OnboardingCubit onboardingCubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: PageView.builder(
        itemBuilder: (context, index) => OnboardingWidget(
          onboardingModel: onboardingCubit.onboardingPages[index],
          onboardingCubit: onboardingCubit,
        ),
        controller: onboardingCubit.boardController,
        itemCount: onboardingCubit.onboardingPages.length,
        onPageChanged: onboardingCubit.showButton,
      ),
    );
  }
}
