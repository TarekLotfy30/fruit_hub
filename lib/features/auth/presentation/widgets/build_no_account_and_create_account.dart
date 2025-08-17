part of '../screens/login_view.dart';

class _BuildNoAccountAndCreateAccount extends StatelessWidget {
  const _BuildNoAccountAndCreateAccount();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.no_account.tr(),
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Theme.of(
              context,
            ).colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            LocaleKeys.create_account.tr(),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
