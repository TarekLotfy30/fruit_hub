part of '../../screens/sign_in_view.dart';

class _SocialMediaSection extends StatelessWidget {
  const _SocialMediaSection();

  @override
  Widget build(BuildContext context) {
    final cubit = context.signInCubit;
    return BlocListener<SignInCubit, SignInState>(
      listenWhen: (_, current) {
        // Only listen when the current state is a success or failure
        return current is SignInSuccess || current is SignInFailure;
      },
      listener: (context, state) async {
        switch (state) {
          case SignInLoading():
          case SignInInitial():
            break;
          case SignInFailure():
            if (context.mounted) {
              await AppSnackBar.showError(context, state.failure.errorMessage);
            }
          case SignInSuccess():
            if (context.mounted) {
              await AppNavigation.navigateToAndClearStack(
                context,
                AppRoutesName.homeScreen,
              );
            }
        }
      },
      child: Column(
        spacing: Spacing.spacing16.h,
        children: [
          _BuildSocialMediaButton(
            assetPath: AppIcons.google,
            label: LocaleKeys.sign_in_with_google.tr(),
            onPressed: () async {
              await cubit.signInWithGoogle();
            },
          ),
          _BuildSocialMediaButton(
            assetPath: AppIcons.apple,
            colorFilter: context.isDarkMode
                ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                : null,
            label: LocaleKeys.sign_in_with_apple.tr(),
            onPressed: () {
              //cubit.signInWithApple();
            },
          ),

          _BuildSocialMediaButton(
            assetPath: AppIcons.facebook,
            label: LocaleKeys.sign_in_with_facebook.tr(),
            onPressed: () {
              //cubit.signInWithFacebook();
            },
          ),
        ],
      ),
    );
  }
}
