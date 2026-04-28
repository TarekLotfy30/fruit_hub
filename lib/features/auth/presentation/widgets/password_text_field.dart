import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/app_icon_sizes.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/helpers/functions/app_regex.dart';
import '../../../../core/translation/locale_keys.g.dart';
import '../../../../core/widgets/build_text_field.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, required this.passwordController});

  final TextEditingController passwordController;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  String? _passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validation_password_empty.tr();
    } else if (!AppRegex.hasMinLength(value)) {
      return LocaleKeys.validation_password_min_length.tr();
    } else if (!AppRegex.hasUpperCase(value)) {
      return LocaleKeys.validation_password_uppercase.tr();
    } else if (!AppRegex.hasLowerCase(value)) {
      return LocaleKeys.validation_password_lowercase.tr();
    } else if (!AppRegex.hasNumber(value)) {
      return LocaleKeys.validation_password_number.tr();
    } else if (!AppRegex.hasSpecialCharacter(value)) {
      return LocaleKeys.validation_password_special.tr();
    }
    return null;
  }

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return BuildTextField(
      controller: widget.passwordController,
      labelText: LocaleKeys.auth_general_password.tr(),
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      prefixIcon: const Icon(AppIcons.password, size: AppIconSizes.regular),
      suffixIcon: IconButton(
        onPressed: () => setState(() => _isObscure = !_isObscure),
        icon: Icon(
          _isObscure ? AppIcons.visibility : AppIcons.visibilityOff,
          size: AppIconSizes.regular,
        ),
      ),

      inputFormatters: [
        // Reasonable password length limit
        LengthLimitingTextInputFormatter(128),
      ],
      validator: _passwordValidation,
      obscureText: _isObscure,
    );
  }
}
