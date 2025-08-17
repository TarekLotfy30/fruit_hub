part of '../screens/login_view.dart';

class _LoginViewBody extends StatelessWidget {
  const _LoginViewBody();

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
            _BuildLoginForm(),
            _BuildNoAccountAndCreateAccount(),
            _BuildDividerWithText(),
            _BuildSocialMediaSection(),
          ],
        ),
      ),
    );
  }
}

// TODO(TAREK): Consider implementing a loading indicator when the login button
//  is pressed to enhance user experience.
// TODO(TAREK): You might want to add error handling for the login process,
//  such as displaying a SnackBar for failed login attempts.
// TODO(TAREK): For better UX, consider using a bottom sheet for the
//  "Forgot Password" functionality instead of navigating to a new screen.
