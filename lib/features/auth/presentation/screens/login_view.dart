import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_padding.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/helpers/functions/app_spacing.dart';
import '../../../../core/translation/locale_keys.g.dart';
import '../../../../core/widgets/build_optimized_svg.dart';

part '../widgets/build_divider_with_text.dart';
part '../widgets/build_login_form.dart';
part '../widgets/build_no_account_and_create_account.dart';
part '../widgets/build_social_media_button.dart';
part '../widgets/build_social_media_section.dart';
part '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.login.tr()),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: const _LoginViewBody(),
    );
  }
}
