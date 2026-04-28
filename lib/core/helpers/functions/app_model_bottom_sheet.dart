import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_corners.dart';
import '../../constants/app_elevation.dart';
import '../extensions/theme_extension.dart';

Future<T?> openModalBottomSheet<T extends Object?>({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
}) async {
  return showModalBottomSheet<T>(
    context: context,
    builder: builder, //el builder hena hat2ol 3ayzo wakhod height a
    useRootNavigator: true,
    isScrollControlled: true, //tefta7 fulllscreen //allow scrolling
    useSafeArea: true,
    backgroundColor: context.colorScheme.surfaceContainerHigh,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: AppElevation.dialogElevation,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppCorners.smallBorderRadius.r),
      ),
    ),
  );
}
