part of '../../screens/sign_up_view.dart';

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController fullNameController,
  }) : _formKey = formKey,
       _emailController = emailController,
       _passwordController = passwordController,
       _fullNameController = fullNameController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _fullNameController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) async {
        if (state is SignUpFailure) {
          await AppSnackBar.showError(context, state.failure.errorMessage);
        } else if (state is SignUpSuccess) {
          AppNavigation.navigateToAndClearStack(
            context,
            AppRoutesName.signInScreen,
          );
          await AppSnackBar.showSuccess(
            context,
            LocaleKeys.snack_bar_messages_sign_up_success.tr(),
          );
        }
      },
      builder: (context, state) => Visibility(
        visible: state is! SignUpLoading,
        replacement: const Center(child: BuildLoadingAnimation()),
        child: ElevatedButton(
          onPressed: () async {
            {
              FocusScope.of(context).unfocus(); // UX: Close keyboard
              final state = context.signUpCubit.state;
              final isTermsAccepted =
                  state is ToggleTermsAndConditions && state.isAccepted;

              if (!_formKey.currentState!.validate()) {
                // Invalid form inputs
                await AppSnackBar.showWarning(
                  context,
                  LocaleKeys.snack_bar_messages_invalid_inputs.tr(),
                );

                return;
              }

              if (!isTermsAccepted) {
                // Terms not accepted
                await AppSnackBar.showWarning(
                  context,
                  LocaleKeys.snack_bar_messages_must_accept_terms.tr(),
                );
                return;
              }

              // ✅ If valid & terms accepted → call sign up
              await context.signUpCubit.signUp(
                email: _emailController.text.trim(),
                password: _passwordController.text.trim(),
                fullname: _fullNameController.text,
              );
            }
          },
          child: Text(LocaleKeys.sign_up_button.tr()),
        ),
      ),
    );
  }
}
