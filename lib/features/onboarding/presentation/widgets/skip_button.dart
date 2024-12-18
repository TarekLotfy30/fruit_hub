part of 'onboarding_view_body.dart';

class _SkipButton extends StatelessWidget {
  const _SkipButton({
    super.key,
    required this.onboardingCubit,
  });

  final OnboardingCubit onboardingCubit;

  Future<void> _navigateToLogin(BuildContext context) async {
    context.removeAllAndNavigateToNamedRoute(
      Routes.loginScreen,
      predicate: (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        onboardingCubit.finishOnboarding();
        _navigateToLogin(context);
      },
      child: const AppText(text: 'تخط'),
    );
  }
}
