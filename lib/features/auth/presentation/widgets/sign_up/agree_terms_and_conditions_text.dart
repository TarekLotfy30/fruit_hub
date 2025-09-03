part of '../../screens/sign_up_view.dart';

class _AgreeTermsAndConditionsText extends StatelessWidget {
  const _AgreeTermsAndConditionsText();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '${LocaleKeys.sign_up_agree_terms.tr()} ',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
            ),
          ),
          WidgetSpan(
            child: InkWell(
              onTap: () async {
                await openModalBottomSheet(
                  context: context,
                  builder: (context) => const _TermsAndConditionsSheet(),
                );
              },
              child: Text(
                LocaleKeys.sign_up_terms_and_conditions.tr(),
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  decoration: TextDecoration.underline,
                  decorationColor: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
