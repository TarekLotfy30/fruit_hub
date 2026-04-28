part of '../screens/onboarding_view.dart';

class _PageViewItem extends StatelessWidget {
  const _PageViewItem({required this.item});

  final OnboardingModel item;

  Future<void> _onSkipTap(BuildContext context) async {
    context.onboardingCubit.skipAndSave();
    AppNavigation.navigateToAndReplace(context, AppRoutesName.signInScreen);
  }

  @override
  Widget build(BuildContext context) {
    final colorSchema = context.colorScheme;
    final textTheme = context.textTheme;
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
                          child: Text(LocaleKeys.onboarding_skip.tr()),
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
                      style: textTheme.displayLarge,
                    ),
                    TextSpan(
                      text: item.titleTextSpan2,
                      style: textTheme.displayLarge?.copyWith(
                        color: colorSchema.primary,
                      ),
                    ),
                    TextSpan(
                      text: item.titleTextSpan3,
                      style: textTheme.displayLarge?.copyWith(
                        color: colorSchema.tertiary,
                      ),
                    ),
                  ],
                ),
              ),
              child: Text(item.title ?? '', style: textTheme.displayLarge),
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
                style: textTheme.labelMedium?.copyWith(
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
