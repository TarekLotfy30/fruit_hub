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
    return BlocConsumer<SignInCubit, SignInState>(
      listenWhen: (_, current) {
        // Only listen when the current state is a success or failure
        return current is SignInSuccess || current is SignInFailure;
      },
      listener: (context, state) async {
        switch (state) {
          case SignInLoading():
          case SignInInitial():
            break;
          case SignInFailure():
            if (context.mounted) {
              await AppSnackBar.showError(context, state.failure.errorMessage);
            }
          case SignInSuccess():
            if (context.mounted) {
              await AppNavigation.navigateToAndClearStack(
                context,
                AppRoutesName.homeScreen,
              );
            }
        }
      },
      buildWhen: (previous, current) {
        // Only rebuild when showing/hiding loading indicator
        return current is SignInLoading || previous is SignInLoading;
      },
      builder: (context, state) {
        switch (state) {
          case SignInLoading():
            return const BuildLoadingAnimation();
          case SignInInitial():
          case SignInFailure():
          case SignInSuccess():
            break;
        }
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
            // All inputs are valid, proceed to sign up
            final email = _emailController.text.trim();
            final password = _passwordController.text.trim();

            await context.signInCubit.signIn(
              user: UserModel(
                email: email,
                password: password,
                uid: '',
                fullname: '',
              ),
            );
          },
          child: Text(LocaleKeys.sign_in_sign_in.tr()),
        );
      },
    );
  }
}
