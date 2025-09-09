part of '../screens/onboarding_view.dart';

class _BuildPageView extends StatelessWidget {
  const _BuildPageView(this._pageController);

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    final cubit = context.onboardingCubit;
    final onboardingItems = AppConstant.onboardingItems;
    return PageView.builder(
      controller: _pageController,
      itemCount: onboardingItems.length,
      itemBuilder: (context, index) =>
          _PageViewItem(item: onboardingItems[index]),
      onPageChanged: cubit.changePage,
      physics: const PageScrollPhysics(),
    );
  }
}
