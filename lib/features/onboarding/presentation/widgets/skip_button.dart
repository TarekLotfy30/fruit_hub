part of 'onboarding_view_body.dart';

class _SkipButton extends StatelessWidget {
  const _SkipButton({
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
        horizontal: 10,
        vertical: 20,
      ),
      child: TextButton(
        onPressed: () async => _navigateToLogin(context),
        child: AppText(
          text: 'تخط',
          style: AppStyles.textStyle13.copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
