part of '../../screens/sign_in_view.dart';

class _SignInButton extends StatelessWidget {
  const _SignInButton({
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) : _formKey = formKey,
       _emailController = emailController,
       _passwordController = passwordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        FocusScope.of(context).unfocus(); // UX: Close keyboard
        if (!_formKey.currentState!.validate()) {
          // Invalid form inputs
          await AppSnackBar.showWarning(
            context,
            LocaleKeys.snack_bar_messages_invalid_inputs.tr(),
          );
          return;
        }
        await context.signInCubit.signIn(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      },
      child: Text(LocaleKeys.sign_in_sign_in.tr()),
    );
  }
}
