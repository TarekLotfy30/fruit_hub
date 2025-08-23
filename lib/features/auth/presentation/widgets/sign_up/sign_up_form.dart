part of '../../screens/sign_up_view.dart';

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
    _formKey = GlobalKey<FormState>();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUnfocus,
      child: Column(
        spacing: Spacing.spacing16.h,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _fullNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '';
              }
              return null;
            },
            inputFormatters: const [],
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            cursorColor: Theme.of(context).colorScheme.primary,
            cursorHeight: 24.h,
            decoration: InputDecoration(labelText: LocaleKeys.full_name.tr()),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
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
            decoration: InputDecoration(labelText: LocaleKeys.email.tr()),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
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
            ),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: _isTermsAccepted,
                onChanged: (value) {
                  setState(() {
                    _isTermsAccepted = value ?? false;
                  });
                },
              ),
              horizontalSpacing(8),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: LocaleKeys.agree_terms.tr(),
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant
                                  .withValues(alpha: 0.6),
                            ),
                      ),
                      TextSpan(
                        text: LocaleKeys.terms_and_conditions.tr(),
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
