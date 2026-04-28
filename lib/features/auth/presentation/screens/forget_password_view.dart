import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/translation/locale_keys.g.dart';
import '../../../../core/widgets/build_back_button_icon.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.forgot_password_forgot_password.tr()),
        centerTitle: true,
        leading: const BuildBackButtonIcon(),
      ),
      body: const Center(child: Text('LocaleKeys.forgot_password.tr()')),
    );
  }
}
