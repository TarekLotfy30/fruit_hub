part of '../../screens/sign_up_view.dart';

class _TermsAndConditionSection extends StatelessWidget {
  const _TermsAndConditionSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            final isChecked =
                state is ToggleTermsAndConditions && state.isAccepted;
            return Checkbox(
              value: isChecked,
              onChanged: (value) {
                context.signUpCubit.toggleTermsAccepted(value: value ?? false);
              },
            );
          },
        ),
        horizontalSpacing(8),
        const Expanded(child: _AgreeTermsAndConditionsText()),
      ],
    );
  }
}
