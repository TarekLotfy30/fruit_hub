import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_icon_sizes.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_padding.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/helpers/app_navigation.dart';
import '../../../../core/helpers/app_spacing.dart';
import '../../../../core/routing/app_routes_name.dart';
import '../../../../core/translation/locale_keys.g.dart';
import '../../../../core/widgets/build_optimized_svg.dart';
import '../../controller/sign_in/sign_in_cubit.dart';

part '../widgets/sign_in/or_divider.dart';
part '../widgets/sign_in/sign_in_form.dart';
part '../widgets/sign_in/no_account_and_create_account.dart';
part '../widgets/sign_in/social_media_button.dart';
part '../widgets/sign_in/social_media_section.dart';
part '../widgets/sign_in/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.sign_in.tr()),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: const _SignInViewBody(),
    );
  }
}
