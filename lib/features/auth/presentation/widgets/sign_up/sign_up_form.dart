part of '../../screens/sign_up_view.dart';

// translate-me-ignore-all-file
/// [_SignUpForm] manages the actual registration inputs and state.
/// Includes full name, email, password, terms agreement, and submission.
///
/// Each input has validators, formatters
class _SignUpForm extends StatefulWidget {
  const _SignUpForm();

  @override
  State<_SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<_SignUpForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  bool _isTermsAccepted = false;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _formKey = GlobalKey<FormState>();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUnfocus,
      child: Column(
        spacing: Spacing.spacing16.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //FullName
          BuildTextField(
            controller: _fullNameController,
            labelText: LocaleKeys.full_name.tr(),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
            prefixIcon: const Icon(AppIcons.user, size: AppIconSizes.regular),
            inputFormatters: [
              // Limit to reasonable name length
              LengthLimitingTextInputFormatter(50),
              // Prevent multiple consecutive spaces
              FilteringTextInputFormatter.deny(RegExp(r'\s{2,}')),
            ],
            validator: _fullNameValidation,
          ),

          //Email
          BuildTextField(
            controller: _emailController,
            labelText: LocaleKeys.email.tr(),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            prefixIcon: const Icon(AppIcons.email, size: AppIconSizes.regular),
            inputFormatters: [
              // RFC 5321 email length limit
              LengthLimitingTextInputFormatter(254),
              // No whitespace
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
            validator: _emailValidation,
          ),

          //Password
          BuildTextField(
            controller: _passwordController,
            labelText: LocaleKeys.password.tr(),
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: const Icon(
              AppIcons.password,
              size: AppIconSizes.regular,
            ),
            suffixIcon: const Icon(
              AppIcons.visibility,
              size: AppIconSizes.regular,
            ),
            inputFormatters: [
              // Reasonable password length limit
              LengthLimitingTextInputFormatter(128),
            ],
            validator: _passwordValidation,
          ),
          // Terms and conditions
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(value: _isTermsAccepted, onChanged: _checkBox),
              horizontalSpacing(8),
              const Expanded(child: _AgreeTermsAndConditionsText()),
            ],
          ),
          verticalSpacing(5),
          // Submit button
          ElevatedButton(
            onPressed: _handleSignUpButton,
            child: Text(LocaleKeys.sign_up_button.tr()),
          ),
        ],
      ),
    );
  }

  void _handleSignUpButton() {
    FocusScope.of(context).unfocus(); // UX: Close keyboard
  }

  void _checkBox(bool? value) {
    setState(() {
      _isTermsAccepted = value ?? false;
    });
  }

  String? _passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    return null;
  }

  String? _emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    return null;
  }

  String? _fullNameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'sdsda';
    }
    return null;
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
