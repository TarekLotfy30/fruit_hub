part of '../../screens/sign_in_view.dart';

class _NoAccountAndCreateAccount extends StatelessWidget {
  const _NoAccountAndCreateAccount({required this.theme});

  final ThemeData theme;
  //final SignInCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.no_account.tr(),
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
          ),
        ),
        TextButton(
          onPressed: () async {
            await AppNavigation.navigateTo(context, AppRoutesName.signUpScreen);
          },
          child: Text(
            LocaleKeys.create_account.tr(),
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
