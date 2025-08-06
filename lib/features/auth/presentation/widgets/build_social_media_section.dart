import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/translation/locale_keys.g.dart';
import 'build_social_media_button.dart';

class BuildSocialMediaSection extends StatelessWidget {
  const BuildSocialMediaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Spacing.spacing16.h,
      children: [
        BuildSocialMediaButton(
          assetPath: AppIcons.google,
          label: LocaleKeys.sign_in_with_google.tr(),
          onPressed: () async {
            // TODO(tarek): add the snackbar and implement the logic
            // await AppSnackBar.showSuccessSnackBar(context, 'afdsdsaf');
          },
        ),

        BuildSocialMediaButton(
          assetPath: AppIcons.apple,
          colorFilter: Theme.of(context).brightness == Brightness.dark
              ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
              : null,
          label: LocaleKeys.sign_in_with_apple.tr(),
          onPressed: () {},
        ),

        BuildSocialMediaButton(
          assetPath: AppIcons.facebook,
          label: LocaleKeys.sign_in_with_facebook.tr(),
          onPressed: () {},
        ),
      ],
    );
  }
}
