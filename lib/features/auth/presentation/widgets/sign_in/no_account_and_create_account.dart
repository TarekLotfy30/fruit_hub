part of '../../screens/sign_in_view.dart';

class _NoAccountAndCreateAccount extends StatelessWidget {
  const _NoAccountAndCreateAccount();


  @override
  Widget build(BuildContext context) {
    final  textTheme = context.textTheme;
    final colorSchema = context.colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.no_account.tr(),
          style: textTheme.labelMedium?.copyWith(
            color: colorSchema.onSurfaceVariant.withValues(alpha: 0.6),
          ),
        ),
        TextButton(
          onPressed: () async {
            await AppNavigation.navigateTo(context, AppRoutesName.signUpScreen);
          },
          child: Text(
            LocaleKeys.create_account.tr(),
            style: textTheme.titleSmall?.copyWith(
              color: colorSchema.primary,
            ),
          ),
        ),
      ],
    );
  }
}
