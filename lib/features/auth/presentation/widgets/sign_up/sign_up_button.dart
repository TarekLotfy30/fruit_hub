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
      listenWhen: (_, current) {
        // Only listen when the current state is a success or failure
        return current is SignUpSuccess || current is SignUpFailure;
      },
      listener: (context, state) async {
        switch (state) {
          case SignUpLoading():
          case SignUpInitial():
          case ToggleTermsAndConditions():
            break;
          case SignUpFailure():
            if (context.mounted) {
              await AppSnackBar.showError(context, state.failure.errorMessage);
            }
          case SignUpSuccess():
            await AppNavigation.navigateToAndClearStack(
              context,
              AppRoutesName.signInScreen,
            );
            if (context.mounted) {
              await AppSnackBar.showSuccess(
                context,
                LocaleKeys.snack_bar_messages_sign_up_success.tr(),
              );
            }
        }
      },
      buildWhen: (previous, current) {
        // Only rebuild when showing/hiding loading indicator
        return current is SignUpLoading || previous is SignUpLoading;
      },
      builder: (context, state) {
        if (state is SignUpLoading) {
          return const Center(child: BuildLoadingAnimation());
        }
        return ElevatedButton(
          onPressed: () async {
            FocusScope.of(context).unfocus(); // UX: Close keyboard

            final state = context.signUpCubit.state;
            final isTermsAccepted =
                state is ToggleTermsAndConditions && state.isAccepted;

            if (!isTermsAccepted) {
              // Terms not accepted
              await AppSnackBar.showWarning(
                context,
                LocaleKeys.snack_bar_messages_must_accept_terms.tr(),
              );
              return;
            }

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
            final fullName = _fullNameController.text.trim();
            await context.signUpCubit.signUp(
              user: UserModel(
                email: email,
                password: password,
                fullname: fullName,
                uid: '',
              ),
            );
          },
          child: Text(LocaleKeys.sign_up_sign_up.tr()),
        );
      },
    );
  }
}
