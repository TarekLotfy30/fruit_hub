import 'dart:ui';

import 'package:flutter/material.dart';

import '../../constants/app_corners.dart';
import '../../utils/colors/app_colors.dart';

/// Shows a generic dialog with custom content and animations
///
/// This function provides a standardized way to show dialogs with blur
/// and fade effects
///
/// @param context The BuildContext where the dialog should appear
/// @param pageBuilder Builder function to create the dialog content
/// @param [barrierDismissible] Whether tapping outside the dialog dismisses it
/// @param [transitionDuration] Duration for the dialog animation
/// @param [blurAmount] The amount of blur effect (sigmaX and sigmaY)
/// @return A Future that completes when the dialog is closed, with the dialog result
Future<T?> showGenericDialog<T>(
  BuildContext context, {
  required Widget Function(BuildContext, Animation<double>, Animation<double>)
  pageBuilder,
  bool barrierDismissible = false,
  Duration transitionDuration = const Duration(milliseconds: 500),
  double blurAmount = 3.0,
}) async {
  return showGeneralDialog<T>(
    context: context,
    transitionDuration: transitionDuration,
    pageBuilder: (ctx, anim1, anim2) => pageBuilder(ctx, anim1, anim2),
    transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: blurAmount * anim1.value,
        sigmaY: blurAmount * anim1.value,
      ),
      child: FadeTransition(opacity: anim1, child: child),
    ),
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black54,
  );
}

/// Shows a confirmation dialog with customizable content and actions
///
/// @param context The BuildContext where the dialog should appear
/// @param title The title of the confirmation dialog
/// @param message The message/content of the confirmation dialog
/// @param [confirmText] Text for the confirm button (defaults to "Confirm")
/// @param [cancelText] Text for the cancel button (defaults to "Cancel")
/// @param [isDanger] Whether this is a dangerous action (changes button colors)
/// @return A Future that resolves to true if confirmed, false otherwise
Future<bool> showConfirmationDialog({
  required BuildContext context,
  required String title,
  required String message,
  String confirmText = 'Confirm',
  String cancelText = 'Cancel',
  bool isDanger = false,
}) async {
  return await showGenericDialog<bool>(
        context,
        pageBuilder: (context, _, _) => AlertDialog(
          title: Text(title),
          content: Text(message),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppCorners.dialogBorderRadius),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(cancelText),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isDanger
                    ? AppColors.error
                    : AppColors.green1_500,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(confirmText),
            ),
          ],
        ),
      ) ??
      false; // Default to false if dialog is dismissed
}
