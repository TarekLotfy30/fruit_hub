part of '../../screens/sign_in_view.dart';

class _SocialMediaSection extends StatelessWidget {
  const _SocialMediaSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Spacing.spacing16.h,
      children: [
        _BuildSocialMediaButton(
          assetPath: AppIcons.google,
          label: LocaleKeys.sign_in_with_google.tr(),
          onPressed: () async {
            // TODO(tarek): add the snackbar and implement the logic
            //await AppSnackBar.showWarning(context, 'لا تمتلك حساب');
          },
        ),
        _BuildSocialMediaButton(
          assetPath: AppIcons.apple,
          colorFilter: context.isDarkMode
              ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
              : null,
          label: LocaleKeys.sign_in_with_apple.tr(),
          onPressed: () {},
        ),

        _BuildSocialMediaButton(
          assetPath: AppIcons.facebook,
          label: LocaleKeys.sign_in_with_facebook.tr(),
          onPressed: () {},
        ),
      ],
    );
  }
}
