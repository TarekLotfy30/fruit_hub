part of '../../screens/sign_up_view.dart';

/// Bottom sheet widget for displaying terms and conditions.
class _TermsAndConditionsSheet extends StatelessWidget {
  const _TermsAndConditionsSheet();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 1,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppPaddings.padding16.w,
            vertical: AppPaddings.padding24.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: AppPaddings.padding16.h,
            children: [
              Expanded(
                child: Column(
                  spacing: AppPaddings.padding16.h,
                  children: [
                    const BuildDragHandleBar(),
                    // Title
                    Text(
                      LocaleKeys.sign_up_terms_and_conditions.tr(),
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Content
                    Text(
                      LocaleKeys.sign_up_terms_content.tr(),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
              // Close button
              ElevatedButton(
                onPressed: () => AppNavigation.goBack(context),
                child: Text(LocaleKeys.sign_up_close.tr()),
              ),
            ],
          ),
        );
      },
    );
  }
}
