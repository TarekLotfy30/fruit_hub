part of '../../screens/sign_in_view.dart';

class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Using Expanded to allow the divider to take up available space
        // because you are inside a row widget
        const Expanded(child: Divider(endIndent: Spacing.spacing16)),
        Text(
          LocaleKeys.or.tr(),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const Expanded(child: Divider(indent: Spacing.spacing16)),
      ],
    );
  }
}
