part of 'onboarding_view_body.dart';

class _StartButton extends StatelessWidget {
  const _StartButton({
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
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      child: ElevatedButton(
        onPressed: () async {
          onboardingCubit.finishOnboarding();
          _navigateToLogin(context);
        },
        child: const AppText(
          text: 'ابدأ الان',
        ),
      ),
    );
  }
}
