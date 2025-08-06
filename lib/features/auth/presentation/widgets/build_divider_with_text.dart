import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/translation/locale_keys.g.dart';

class BuildDividerWithText extends StatelessWidget {
  const BuildDividerWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(endIndent: 18)),
        Text(
          LocaleKeys.or.tr(),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const Expanded(child: Divider(indent: 18)),
      ],
    );
  }
}
