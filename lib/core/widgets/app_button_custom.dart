import 'package:flutter/material.dart';

import '../theming/colors/app_colors.dart';
import '../theming/typography/app_text_style.dart';
import 'app_text_custom.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonBackgroundColor,
    this.buttonWidth,
    this.buttonHeight,
    this.borderRadius,
    required this.buttonText,
    this.textStyle,
  });

  final VoidCallback onPressed;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color? buttonBackgroundColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? borderRadius;
  final String buttonText;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 14,
          vertical: verticalPadding ?? 12,
        ),
        backgroundColor: buttonBackgroundColor ?? AppColors.primaryColor,
        elevation: 0,
        minimumSize: Size(buttonWidth ?? double.maxFinite, buttonHeight ?? 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
        ),
      ),
      child: AppText(
        text: buttonText,
        style: textStyle ??
            AppStyles.textStyle16.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
      ),
    );
  }
}
