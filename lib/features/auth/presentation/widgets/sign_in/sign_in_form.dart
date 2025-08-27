part of '../../screens/sign_in_view.dart';

class _SignInForm extends StatefulWidget {
  const _SignInForm();

  @override
  State<_SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<_SignInForm> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;

  String? _emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    return null;
  }

  String? _passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    return null;
  }

  void _signInButton() {}

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
          BuildTextField(
            validator: _emailValidation,
            labelText: LocaleKeys.email.tr(),
            prefixIcon: const Icon(AppIcons.email, size: AppIconSizes.regular),
            controller: _emailController,
            inputFormatters: [
              // RFC 5321 email length limit
              LengthLimitingTextInputFormatter(254),
              // No whitespace
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          verticalSpacing(Spacing.spacing16),
          BuildTextField(
            validator: _passwordValidation,
            labelText: LocaleKeys.password.tr(),
            prefixIcon: const Icon(
              AppIcons.password,
              size: AppIconSizes.regular,
            ),
            suffixIcon: const Icon(
              AppIcons.visibility,
              size: AppIconSizes.regular,
            ),
            controller: _passwordController,
            inputFormatters: [
              LengthLimitingTextInputFormatter(128),
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
          ),
          verticalSpacing(Spacing.spacing8),
          const _ForgetPasswordButton(),
          verticalSpacing(Spacing.spacing16),
          ElevatedButton(
            onPressed: _signInButton,
            child: Text(LocaleKeys.sign_in.tr()),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
