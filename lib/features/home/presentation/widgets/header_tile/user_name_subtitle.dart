import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors/app_colors.dart';
import '../../../controller/header_cubit/home_header_cubit.dart';

class UserNameSubtitle extends StatelessWidget {
  const UserNameSubtitle({super.key, required this.state});

  final HomeHeaderState state;

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      HomeHeaderInitial() || HomeHeaderLoading() => SizedBox(
        height: 16.h,
        width: 100.w,
        child: const LinearProgressIndicator(),
      ),
      HomeHeaderSuccess(:final fullName) => Text(
        fullName,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      HomeHeaderError() => Text(
        "LocaleKeys.home_error_fetching_name.tr()",
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(color: AppColors.error),
      ),
    };
  }
}
