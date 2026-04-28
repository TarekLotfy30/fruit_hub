part of '../../screens/sign_in_view.dart';

class _SignInFormAndForgetPassword extends StatefulWidget {
  const _SignInFormAndForgetPassword();

  @override
  State<_SignInFormAndForgetPassword> createState() =>
      _SignInFormAndForgetPasswordState();
}

class _SignInFormAndForgetPasswordState
    extends State<_SignInFormAndForgetPassword> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;
  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  /// Initialize text controllers and focus nodes
  void _initializeControllers() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUnfocus,
      key: _formKey,
      child: Column(
        children: [
          EmailTextField(emailController: _emailController),
          verticalSpacing(Spacing.spacing16),
          PasswordTextField(passwordController: _passwordController),
          verticalSpacing(Spacing.spacing8),
          const _ForgetPasswordButton(),
          verticalSpacing(Spacing.spacing16),
          _SignInButton(
            formKey: _formKey,
            emailController: _emailController,
            passwordController: _passwordController,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController
      ..clear()
      ..dispose();
    _passwordController
      ..clear()
      ..dispose();
    super.dispose();
  }
}
