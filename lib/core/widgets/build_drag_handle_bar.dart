import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/extensions/theme_extension.dart';

class BuildDragHandleBar extends StatelessWidget {
  const BuildDragHandleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: 60.w,
        height: 4.h,
        decoration: BoxDecoration(
          color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(2.r),
        ),
      ),
    );
  }
}
