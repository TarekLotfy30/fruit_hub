import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_corners.dart';
import '../../constants/app_durations.dart';
import '../../constants/app_elevation.dart';
import '../../constants/app_icons.dart';
import '../../constants/app_padding.dart';
import '../../utils/colors/app_colors.dart';

class AppSnackBar {
  const AppSnackBar._();

  static Future<void> _showSnackBar(
    BuildContext context,
    String message,
    Color backgroundColor, {
    String? action,
    TextStyle? style,
    IconData? icon,
  }) async {
    if (context.mounted) {
      final messenger = ScaffoldMessenger.of(context);

      // Hide any existing snackbars first
      messenger.hideCurrentSnackBar();

      messenger.showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Text(
                message,
                style:
                    style ??
                    Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onInverseSurface,
                    ),
              ),
              const Spacer(),
              // Optional ICON
              Icon(
                icon,
                color: Theme.of(context).colorScheme.onInverseSurface,
                size: 24.r,
              ),
            ],
          ),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppCorners.inputBorderRadius.r),
          ),
          behavior: SnackBarBehavior.floating,
          elevation: AppElevation.snackBarElevation,
          duration: AppDurations.snackbarStandard, //3
          margin: EdgeInsets.symmetric(
            horizontal: AppPaddings.padding16.w,
            vertical: AppPaddings.padding16.h,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: AppPaddings.padding12.w,
            vertical: AppPaddings.padding12.h,
          ),
          dismissDirection: DismissDirection.endToStart,
          action: action != null
              ? SnackBarAction(
                  label: action,
                  onPressed: messenger.hideCurrentSnackBar,
                )
              : null,
        ),
      );
    }
  }

  /// Shows a success snackbar with a pre-defined style
  ///
  /// @param context The BuildContext where the snackbar should appear
  /// @param message The text message to display in the snackbar
  /// @param [action] Optional action text for the snackbar
  /// @return A Future that completes when the snackbar is shown
  static Future<void> showSuccessSnackBar(
    BuildContext context,
    String message, {
    String? action,
  }) async {
    return _showSnackBar(
      context,
      message,
      AppColors.success,
      action: action,
      icon: AppIcons.success,
    );
  }

  /// Shows an error snackbar with a pre-defined style
  ///
  /// @param context The BuildContext where the snackbar should appear
  /// @param message The text message to display in the snackbar
  /// @param [action] Optional action text for the snackbar
  /// @return A Future that completes when the snackbar is shown
  static Future<void> showErrorSnackBar(
    BuildContext context,
    String message, {
    String? action,
  }) async {
    return _showSnackBar(
      context,
      message,
      AppColors.error,
      action: action,
      icon: AppIcons.error,
    );
  }

  /// Shows a warning snackbar with pre-defined styling
  ///
  /// @param context The BuildContext where the snackbar should appear
  /// @param message The warning message to display
  /// @param action Optional action configuration
  /// @param duration Custom duration (default: 4 seconds)
  /// @return A Future that completes when the snackbar is shown
  // static Future<void> showWarning(
  //   BuildContext context,
  //   String message, {
  //   String? action,
  // }) async {
  //   return show(
  //     context,
  //     message,
  //     type: SnackBarType.warning,
  //     action: action,
  //     duration: duration,
  //   );
  // }

  /// Shows an info snackbar with pre-defined styling
  ///
  /// @param context The BuildContext where the snackbar should appear
  /// @param message The info message to display
  /// @param action Optional action configuration
  /// @param duration Custom duration (default: 3 seconds)
  /// @return A Future that completes when the snackbar is shown
  // static Future<void> showInfo(
  //   BuildContext context,
  //   String message, {
  //   SnackBarActionConfig? action,
  //   Duration? duration,
  // }) async {
  //   return show(
  //     context,
  //     message,
  //     type: SnackBarType.info,
  //     action: action,
  //     duration: duration,
  //   );
  // }
}
