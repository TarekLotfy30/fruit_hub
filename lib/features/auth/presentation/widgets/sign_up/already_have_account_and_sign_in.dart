part of '../../screens/sign_up_view.dart';

class _AlreadyHaveAccountAndSignIn extends StatelessWidget {
  const _AlreadyHaveAccountAndSignIn();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.already_have_account.tr(),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(
              context,
            ).colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
          ),
        ),
        TextButton(
          onPressed: () {
            AppNavigation.goBack(context);
          },
          child: Text(
            LocaleKeys.sign_in.tr(),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
