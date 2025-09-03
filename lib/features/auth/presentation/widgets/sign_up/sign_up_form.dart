part of '../../screens/sign_up_view.dart';

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
  // Form management
  late final GlobalKey<FormState> _formKey;

  // Input controllers - using late final for immutable references
  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  /// Initializes all text editing controllers with proper lifecycle management
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
          _FullNameTextField(fullNameController: _fullNameController),
          EmailTextField(emailController: _emailController),
          PasswordTextField(passwordController: _passwordController),
          const _TermsAndConditionSection(),
          verticalSpacing(5),
          _SignUpButton(
            formKey: _formKey,
            emailController: _emailController,
            passwordController: _passwordController,
            fullNameController: _fullNameController,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.clear();
    _fullNameController.clear();
    _emailController.clear();
    // Dispose controllers in reverse order of creation
    _passwordController.dispose();
    _emailController.dispose();
    _fullNameController.dispose();
    super.dispose();
  }
}
