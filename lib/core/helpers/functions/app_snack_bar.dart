import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_corners.dart';
import '../../constants/app_durations.dart';
import '../../constants/app_elevation.dart';
import '../../constants/app_icon_sizes.dart';
import '../../constants/app_icons.dart';
import '../../constants/app_padding.dart';
import '../../utils/colors/app_colors.dart';

abstract class AppSnackBar {
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
      final theme = Theme.of(context);

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
                    theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onInverseSurface,
                    ),
              ),
              const Spacer(),
              Icon(
                icon,
                color: theme.colorScheme.onInverseSurface,
                size: AppIconSize.regular.r,
              ),
            ],
          ),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppCorners.inputBorderRadius.r),
          ),
          behavior: SnackBarBehavior.floating,
          elevation: AppElevation.snackBarElevation,
          duration: AppDurations.snackbarStandard,

          //3
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
  static Future<void> showSuccess(
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
  static Future<void> showError(
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
  static Future<void> showWarning(
    BuildContext context,
    String message, {
    String? action,
  }) async {
    return _showSnackBar(
      context,
      message,
      AppColors.warning,
      action: action,
      icon: AppIcons.warning,
    );
  }

  /// Shows an info snackbar with pre-defined styling
  ///
  /// @param context The BuildContext where the snackbar should appear
  /// @param message The info message to display
  /// @param action Optional action configuration
  /// @param duration Custom duration (default: 3 seconds)
  /// @return A Future that completes when the snackbar is shown
  static Future<void> showInfo(
    BuildContext context,
    String message, {
    String? action,
  }) async {
    return _showSnackBar(
      context,
      message,
      AppColors.info,
      action: action,
      icon: AppIcons.info,
    );
  }
}
