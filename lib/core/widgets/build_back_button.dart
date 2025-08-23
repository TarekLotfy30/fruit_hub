
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_border_width.dart';
import '../constants/app_icons.dart';
import '../constants/app_padding.dart';
import '../helpers/app_navigation.dart';
import '../utils/colors/app_colors.dart';
import 'build_optimized_svg.dart';

class BuildBackButtonIcon extends StatelessWidget {
  const BuildBackButtonIcon({
    super.key,
    required this.isLTR,
    required this.theme,
  });

  final bool isLTR;
  final ThemeData theme;

  void handleNavigation(BuildContext context) {
    // Use AppNavigation to handle back navigation
    // This allows for consistent navigation handling across the app
    if (Navigator.canPop(context)) {
      AppNavigation.goBack(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isLTR
          ? EdgeInsets.only(left: AppPaddings.padding14.w)
          : EdgeInsets.only(right: AppPaddings.padding14.w),
      child: Material(
        color: Colors.transparent,
        shape: CircleBorder(
          side: BorderSide(
            color: theme.colorScheme.onInverseSurface,
            width: AppBorderWidth.focusedBorderWidth.w,
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: () => handleNavigation(context),
          child: Container(
            padding: EdgeInsets.all(AppPaddings.padding14 - 1.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: theme.colorScheme.onInverseSurface,
                width: AppBorderWidth.focusedBorderWidth.w,
              ),
            ),
            child: BuildOptimizedSvg(
              assetPath: isLTR ? AppIcons.rightArrow : AppIcons.leftArrow,
              colorFilter: theme.brightness == Brightness.dark
                  ? const ColorFilter.mode(AppColors.white, BlendMode.srcIn)
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
