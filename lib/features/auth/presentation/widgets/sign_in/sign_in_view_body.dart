part of '../../screens/sign_in_view.dart';

class _SignInViewBody extends StatelessWidget {
  const _SignInViewBody();

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
            _SignInFormAndForgetPassword(),
            _NoAccountAndCreateAccount(),
            _OrDivider(),
            _SocialMediaSection(),
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
