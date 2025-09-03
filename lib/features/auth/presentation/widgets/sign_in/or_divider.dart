part of '../../screens/sign_in_view.dart';

class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return Row(
      children: [
        // Using Expanded to allow the divider to take up available space
        // because you are inside a row widget
        const Expanded(child: Divider(endIndent: Spacing.spacing16)),
        Text(
          LocaleKeys.sign_in_or.tr(),
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
        const Expanded(child: Divider(indent: Spacing.spacing16)),
      ],
    );
  }
}
