part of '../screens/onboarding_view.dart';

class _BuildActionButton extends StatelessWidget {
  const _BuildActionButton({required this.cubit});

  final OnboardingCubit cubit;

  Future<void> _onStartButton(BuildContext context) async {
    cubit.skipAndSave();
    await AppNavigation.navigateToAndReplace(
      context,
      AppRoutesName.signInScreen,
    );
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
          replacement: const SizedBox.shrink(),
          child: ElevatedButton(
            onPressed: () => _onStartButton(context),
            child: Text(LocaleKeys.start_now.tr()),
          ),
        );
      },
    );
  }
}
