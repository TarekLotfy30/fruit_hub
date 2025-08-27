part of '../../screens/sign_up_view.dart';

/// Body of the SignUp screen.
/// Holds the form and manages spacing and AlreadyHaveAccountAndSignIn.
class _SignUpViewBody extends StatelessWidget {
  const _SignUpViewBody();

  Future<void> _onChangeLanguageTap(BuildContext context) async {
    if (context.locale.toString() == 'ar_SA') {
      context.localizationCubit.changeLanguage(
        context,
        const Locale('en', 'US'),
      );
      return;
    } else {
      context.localizationCubit.changeLanguage(
        context,
        const Locale('ar', 'SA'),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPaddings.padding16.w,
          vertical: AppPaddings.padding24.w,
        ),
        child: Column(
          spacing: Spacing.spacing16.h,
          children: [
            const _SignUpForm(),
            const _AlreadyHaveAccountAndSignIn(),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppPaddings.padding16.w,
                  vertical: AppPaddings.padding32.h,
                ),
                child: TextButton(
                  onPressed: () => _onChangeLanguageTap(context),
                  child: Text(LocaleKeys.change_lang.tr()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
