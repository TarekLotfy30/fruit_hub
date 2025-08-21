part of '../screens/onboarding_view.dart';

class _PageViewItem extends StatelessWidget {
  const _PageViewItem({
    required this.item,
    required this.cubit,
    required this.theme,
  });

  final OnboardingModel item;
  final OnboardingCubit cubit;
  final ThemeData theme;

  Future<void> _onSkipTap(BuildContext context) async {
    cubit.skipAndSave();
    Navigation.navigateToAndReplace(context, AppRoutesName.signInScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 313.h,
          child: Stack(
            children: [
              Positioned.fill(
                child: BuildOptimizedSvg(
                  assetPath: item.backgroundImage,
                  semanticLabel: 'Background Color',
                  fit: BoxFit.fill,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BuildOptimizedSvg(
                  assetPath: item.image,
                  semanticLabel: 'image',
                ),
              ),
              BlocBuilder<OnboardingCubit, OnboardingState>(
                builder: (context, state) {
                  return Visibility(
                    visible: state is! OnboardingChanged,
                    replacement: const SizedBox.shrink(),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPaddings.padding16.w,
                          vertical: AppPaddings.padding32.h,
                        ),
                        child: TextButton(
                          onPressed: () => _onSkipTap(context),
                          child: Text(LocaleKeys.skip.tr()),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        verticalSpacing(Spacing.spacing40),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // title
            Visibility(
              visible: item.isLast,
              replacement: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: item.titleTextSpan1,
                      style: theme.textTheme.displayLarge,
                    ),
                    TextSpan(
                      text: item.titleTextSpan2,
                      style: theme.textTheme.displayLarge?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    TextSpan(
                      text: item.titleTextSpan3,
                      style: theme.textTheme.displayLarge?.copyWith(
                        color: theme.colorScheme.tertiary,
                      ),
                    ),
                  ],
                ),
              ),
              child: Text(
                item.title ?? '',
                style: theme.textTheme.displayLarge,
              ),
            ),
            verticalSpacing(Spacing.spacing24),
            // subtitle
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPaddings.padding32.w,
              ),
              child: Text(
                item.subTitle,
                textAlign: TextAlign.center,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: AppColors.textTertiary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
