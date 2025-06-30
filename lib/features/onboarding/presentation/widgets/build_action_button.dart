part of '../widgets/onboarding_view_body.dart';

class _BuildActionButton extends StatelessWidget {
  const _BuildActionButton();

  Future<void> _onStartButton(BuildContext context) async {
    context.read<OnboardingCubit>().skipandSave();
    await Navigation.pushAndRemove(context, RoutesName.loginScreen);
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
