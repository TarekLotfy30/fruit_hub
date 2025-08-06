import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_padding.dart';
import 'build_divider_with_text.dart';
import 'build_login_form.dart';
import 'build_no_account_and_create_account.dart';
import 'build_social_media_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPaddings.padding16.w,
          vertical: AppPaddings.padding24.w,
        ),
        child: Column(
          spacing: AppPaddings.padding16.h,
          children: const [
            BuildLoginForm(),
            BuildNoAccountAndCreateAccount(),
            BuildDividerWithText(),
            BuildSocialMediaSection(),
          ],
        ),
      ),
    );
  }
}

// TODO(TAREK): Consider implementing a loading indicator when the login button is pressed to enhance user experience.
// TODO(TAREK): You might want to add error handling for the login process, such as displaying a SnackBar for failed login attempts.
// TODO(TAREK): For better UX, consider using a bottom sheet for the "Forgot Password" functionality instead of navigating to a new screen.
