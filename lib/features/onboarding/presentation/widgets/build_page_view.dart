part of '../widgets/onboarding_view_body.dart';

class _BuildPageView extends StatelessWidget {
  const _BuildPageView();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: context.read<OnboardingCubit>().pageController,
      itemCount: AppConstant.onboardingItems.length,
      itemBuilder: (context, index) =>
          _PageViewItem(item: AppConstant.onboardingItems[index]),
      onPageChanged: (index) {
        // Update cubit state
        context.read<OnboardingCubit>().changePage(index);
      },
      physics: const BouncingScrollPhysics(),
    );
  }
}
