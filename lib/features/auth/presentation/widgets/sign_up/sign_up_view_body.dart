part of '../../screens/sign_up_view.dart';

/// Body of the SignUp screen.
/// Holds the form and manages spacing and AlreadyHaveAccountAndSignIn.
class _SignUpViewBody extends StatelessWidget {
  const _SignUpViewBody();

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
          children: const [_SignUpForm(), _AlreadyHaveAccountAndSignIn()],
        ),
      ),
    );
  }
}
