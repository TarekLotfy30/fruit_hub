part of '../widgets/onboarding_view_body.dart';

class _PageViewItem extends StatelessWidget {
  const _PageViewItem(this._item);

  final OnboardingModel _item;

  Future<void> _onSkipTap(BuildContext context) async {
    context.read<OnboardingCubit>().skipandSave();
    Navigation.pushAndRemove(context, RoutesName.loginScreen);
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
                  assetPath: _item.backgroundImage,
                  semanticLabel: 'Background Color',
                  fit: BoxFit.fill,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BuildOptimizedSvg(
                  assetPath: _item.image,
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
              visible: _item.isLast,
              replacement: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: _item.titleTextSpan1,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    TextSpan(
                      text: _item.titleTextSpan2,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    TextSpan(
                      text: _item.titleTextSpan3,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ],
                ),
              ),
              child: Text(
                _item.title ?? '',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            verticalSpacing(Spacing.spacing24),
            // subtitle
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPaddings.padding32.w,
              ),
              child: Text(
                _item.subTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
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
