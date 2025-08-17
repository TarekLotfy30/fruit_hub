part of '../screens/onboarding_view.dart';

class _BuildPageView extends StatelessWidget {
  const _BuildPageView({
    required this.cubit,
    required this.onboardingItems,
    required this.theme,
  });

  final OnboardingCubit cubit;
  final List<OnboardingModel> onboardingItems;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: cubit.pageController,
      itemCount: onboardingItems.length,
      itemBuilder: (context, index) => _PageViewItem(
        item: onboardingItems[index],
        cubit: cubit,
        theme: theme,
      ),
      onPageChanged: cubit.changePage,
      physics: const BouncingScrollPhysics(),
    );
  }
}
