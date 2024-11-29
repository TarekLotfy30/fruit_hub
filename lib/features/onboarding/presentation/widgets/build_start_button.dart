part of 'onboarding_view_body.dart';

class _BuildStartButton extends StatelessWidget {
  const _BuildStartButton({
    required this.onboardingCubit,
  });

  final OnboardingCubit onboardingCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Visibility(
          visible: onboardingCubit.cubitIndex == 1,
          replacement: const SizedBox(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppButton(
              onPressed: () {},
              buttonText: 'ابدأ الان',
            ),
          ),
        );
      },
    );
  }
}
