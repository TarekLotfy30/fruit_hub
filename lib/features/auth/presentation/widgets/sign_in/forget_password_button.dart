part of '../../screens/sign_in_view.dart';

class _ForgetPasswordButton extends StatelessWidget {
  const _ForgetPasswordButton();

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(
        onPressed: () async {
          await AppNavigation.navigateTo(
            context,
            AppRoutesName.forgetPasswordScreen,
          );
        },
        child: Text(
          LocaleKeys.forgot_password.tr(),
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
