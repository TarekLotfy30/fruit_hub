import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_icon_sizes.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_padding.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/helpers/extensions/controller_extension.dart';
import '../../../../core/helpers/functions/app_model_bottom_sheet.dart';
import '../../../../core/helpers/functions/app_navigation.dart';
import '../../../../core/helpers/functions/app_regex.dart';
import '../../../../core/helpers/functions/app_snack_bar.dart';
import '../../../../core/helpers/functions/app_spacing.dart';
import '../../../../core/routing/app_routes_name.dart';
import '../../../../core/translation/locale_keys.g.dart';
import '../../../../core/widgets/build_back_button_icon.dart';
import '../../../../core/widgets/build_drag_handle_bar.dart';
import '../../../../core/widgets/build_loading_animation.dart';
import '../../../../core/widgets/build_text_field.dart';
import '../../controller/sign_up/sign_up_cubit.dart';
import '../widgets/email_text_field.dart';
import '../widgets/password_text_field.dart';

part '../widgets/sign_up/sign_up_view_body.dart';
part '../widgets/sign_up/sign_up_form.dart';
part '../widgets/sign_up/already_have_account_and_sign_in.dart';
part '../widgets/sign_up/agree_terms_and_conditions_text.dart';
part '../widgets/sign_up/terms_and_conditions_sheet.dart';
part '../widgets/sign_up/full_name_text_field.dart';
part '../widgets/sign_up/terms_and_condition_section.dart';
part '../widgets/sign_up/sign_up_button.dart';

/// SignUpView is the main entry screen for user registration.
class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.sign_up_sign_up.tr()),
        leading: const BuildBackButtonIcon(),
      ),
      body: const _SignUpViewBody(),
    );
  }
}
