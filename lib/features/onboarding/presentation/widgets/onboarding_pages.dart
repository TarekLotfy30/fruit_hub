part of 'onboarding_view_body.dart';

class _OnboardingPages extends StatelessWidget {
  const _OnboardingPages({
    super.key,
    required this.onboardingCubit,
  });

  final OnboardingCubit onboardingCubit;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.72,
      ),
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
