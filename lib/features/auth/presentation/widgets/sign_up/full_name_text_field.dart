part of '../../screens/sign_up_view.dart';

class _FullNameTextField extends StatelessWidget {
  const _FullNameTextField({required this.fullNameController});

  final TextEditingController fullNameController;

  String? _fullNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validation_fullname_empty.tr();
    } else if (AppRegex.isUsernameValid(value)) {
      return LocaleKeys.validation_fullname_invalid.tr();
    } else if (value.length > 50) {
      return LocaleKeys.validation_fullname_too_long.tr();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final inputFormatters = [
      // Limit to reasonable name length
      LengthLimitingTextInputFormatter(50),
      // No multiple spaces
      FilteringTextInputFormatter.deny(RegExp(r'\s{2,}')),
    ];
    return BuildTextField(
      controller: fullNameController,
      labelText: LocaleKeys.sign_up_full_name.tr(),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.words,
      prefixIcon: const Icon(AppIcons.user, size: AppIconSizes.regular),
      inputFormatters: inputFormatters,
      validator: _fullNameValidator,
    );
  }
}
