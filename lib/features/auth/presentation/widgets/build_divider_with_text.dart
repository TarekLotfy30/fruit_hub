part of '../screens/login_view.dart';

class _BuildDividerWithText extends StatelessWidget {
  const _BuildDividerWithText();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(endIndent: 18)),
        Text(
          LocaleKeys.or.tr(),
          style: Theme
              .of(context)
              .textTheme
              .titleMedium
              ?.copyWith(
            color: Theme
                .of(context)
                .colorScheme
                .onSurface,
          ),
        ),
        const Expanded(child: Divider(indent: 18)),
      ],
    );
  }
}
