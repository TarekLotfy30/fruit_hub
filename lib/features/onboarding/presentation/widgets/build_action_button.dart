part of '../widgets/onboarding_view_body.dart';

class _BuildActionButton extends StatelessWidget {
  const _BuildActionButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Visibility(
          visible: state is OnboardingChanged,
          replacement: const SizedBox(),
          child: Positioned(
            bottom: AppPaddings.padding16.h,
            right: AppPaddings.padding16.w,
            left: AppPaddings.padding16.w,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(LocaleKeys.start_now.tr()),
            ),
          ),
        );
      },
    );
  }
}
