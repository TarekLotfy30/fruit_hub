import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/translation/locale_keys.g.dart';

class BuildNoAccountAndCreateAccount extends StatelessWidget {
  const BuildNoAccountAndCreateAccount({super.key});

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
