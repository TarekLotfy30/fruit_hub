part of '../screens/onboarding_view.dart';

class _BuildActionButton extends StatelessWidget {
  const _BuildActionButton();

  Future<void> _onStartButton(BuildContext context) async {
    await context.onboardingCubit.skipAndSave();
    if (context.mounted) {
      await AppNavigation.navigateToAndReplace(
        context,
        AppRoutesName.signInScreen,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Visibility(
          maintainAnimation: true,
          maintainState: true,
          maintainSize: true,
          visible: state is OnboardingChanged,
          child: ElevatedButton(
            onPressed: () => _onStartButton(context),
            child: Text(LocaleKeys.onboarding_start_now.tr()),
          ),
        );
      },
    );
  }
}
