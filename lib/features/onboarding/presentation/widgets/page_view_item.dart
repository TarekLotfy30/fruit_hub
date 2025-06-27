part of '../widgets/onboarding_view_body.dart';

class _PageViewItem extends StatelessWidget {
  const _PageViewItem({required this.item});

  final OnboardingModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 313.h,
          child: Stack(
            children: [
              BlocBuilder<OnboardingCubit, OnboardingState>(
                builder: (context, state) {
                  return Visibility(
                    visible: state is OnboardingChanged,
                    replacement: Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(LocaleKeys.skip.tr()),
                      ),
                    ),
                    child: const SizedBox(),
                  );
                },
              ),
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
            ],
          ),
        ),
        verticalSpacing(40),
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
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    TextSpan(
                      text: item.titleTextSpan2,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    TextSpan(
                      text: item.titleTextSpan3,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ],
                ),
              ),
              child: Text(
                item.title ?? '',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            verticalSpacing(24),
            // subtitle
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 46.w),
              child: Text(
                item.subTitle,
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
