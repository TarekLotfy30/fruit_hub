import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/app_icon_sizes.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/helpers/functions/app_regex.dart';
import '../../../../core/translation/locale_keys.g.dart';
import '../../../../core/widgets/build_text_field.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key, required this.emailController});

  final TextEditingController emailController;

  String? _emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validation_email_empty.tr();
    } else if (!AppRegex.isEmailValid(value)) {
      return LocaleKeys.validation_email_invalid.tr();
    } else if (value.length > 254) {
      return LocaleKeys.validation_email_too_long.tr();
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final inputFormatters = [
      // RFC 5321 email length limit
      LengthLimitingTextInputFormatter(254),
      // No whitespace in email
      FilteringTextInputFormatter.deny(RegExp(r'\s')),
    ];
    return BuildTextField(
      controller: emailController,
      labelText: LocaleKeys.auth_general_email.tr(),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      prefixIcon: const Icon(AppIcons.email, size: AppIconSizes.regular),
      inputFormatters: inputFormatters,
      validator: _emailValidation,
    );
  }
}
