part of '../widgets/onboarding_view_body.dart';

class _BuildPageView extends StatelessWidget {
  const _BuildPageView();

  @override
  Widget build(BuildContext context) {
    // Initialize cubit
    final cubit = context.read<OnboardingCubit>();
    return PageView.builder(
      controller: cubit.pageController,
      itemCount: AppConstant.onboardingItems.length,
      itemBuilder: (context, index) =>
          _PageViewItem(AppConstant.onboardingItems[index]),
      onPageChanged: cubit.changePage,
      physics: const BouncingScrollPhysics(),
    );
  }
}
