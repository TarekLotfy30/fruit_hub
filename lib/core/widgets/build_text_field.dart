import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/extensions/responsive_and_theme_extension.dart';

class BuildTextField extends StatelessWidget {
  const BuildTextField({
    super.key,
    required this.controller,
    required this.validator,
    required this.keyboardType,
    required this.labelText,
    required this.textInputAction,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.textCapitalization,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String? Function(String?) validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final String labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textSchema = context.textTheme;
    return TextFormField(
      controller: controller,
      validator: validator,
      inputFormatters: inputFormatters,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      cursorColor: colorScheme.primary,
      cursorHeight: 24.h,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      style: textSchema.titleMedium?.copyWith(color: colorScheme.onSurface),

      cursorErrorColor: colorScheme.error,
      obscureText: obscureText,
    );
  }
}
