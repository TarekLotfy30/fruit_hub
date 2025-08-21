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
          TextFormField(
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '';
              }
              return null;
            },
            inputFormatters: [
              // RFC 5321 email length limit
              LengthLimitingTextInputFormatter(254),
              // No whitespace
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: Theme.of(context).colorScheme.primary,
            cursorHeight: 24.h,
            decoration: InputDecoration(
              labelText: LocaleKeys.email.tr(),
              prefixIcon: const Icon(AppIcons.email, size: 24),
            ),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          verticalSpacing(Spacing.spacing16),
          TextFormField(
            controller: _passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '';
              }
              return null;
            },
            inputFormatters: const [],
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),

            textInputAction: TextInputAction.done,
            cursorColor: Theme.of(context).colorScheme.primary,
            cursorHeight: 24.h,
            decoration: InputDecoration(
              labelText: LocaleKeys.password.tr(),
              suffixIcon: const Icon(Icons.remove_red_eye),
              prefixIcon: const Icon(AppIcons.password, size: 24),
            ),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          verticalSpacing(Spacing.spacing8),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: TextButton(
              onPressed: () {},
              child: Text(
                LocaleKeys.forgot_password.tr(),
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ),
          verticalSpacing(Spacing.spacing16),
          ElevatedButton(
            onPressed: () async {},
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
