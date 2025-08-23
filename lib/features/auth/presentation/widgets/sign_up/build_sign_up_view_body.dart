part of '../../screens/sign_up_view.dart';

class _BuildSignUpViewBody extends StatelessWidget {
  const _BuildSignUpViewBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddings.padding16.w,
        vertical: AppPaddings.padding24.w,
      ),
      child: Column(
        children: [
          _SignUpForm(),
        ],
      ),
    );
  }
}
