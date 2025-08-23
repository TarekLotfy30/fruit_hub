import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_padding.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/helpers/app_spacing.dart';
import '../../../../core/translation/locale_keys.g.dart';
import '../../../../core/widgets/build_back_button.dart';

part '../widgets/sign_up/build_sign_up_view_body.dart';
part '../widgets/sign_up/sign_up_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    // Extract locale information once to avoid multiple context reads
    final Locale currentLocale = context.locale;
    final bool isLTR = currentLocale.languageCode == 'en';
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.sign_up.tr()),
        leading: BuildBackButtonIcon(isLTR: isLTR, theme: theme),
      ),
      body: const _BuildSignUpViewBody(),
    );
  }
}
