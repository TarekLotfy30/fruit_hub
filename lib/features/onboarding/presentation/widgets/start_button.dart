part of 'onboarding_view_body.dart';

class _StartButton extends StatelessWidget {
  const _StartButton({
    super.key,
  });

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
      child: AppButton(
        onPressed: () async => _navigateToLogin(context),
        buttonText: 'ابدأ الان',
      ),
    );
  }
}
