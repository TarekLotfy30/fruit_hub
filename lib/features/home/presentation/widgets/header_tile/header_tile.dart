import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/translation/locale_keys.g.dart';
import '../../../../../core/utils/colors/app_colors.dart';
import '../../../../../core/widgets/build_optimized_svg.dart';
import '../../../controller/header_cubit/home_header_cubit.dart';
import 'avatar_initial.dart';
import 'user_name_subtitle.dart';

class HeaderTile extends StatelessWidget {
  const HeaderTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24.r,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: BlocBuilder<HomeHeaderCubit, HomeHeaderState>(
          builder: (context, state) {
            return AvatarInitial(state: state);
          },
        ),
      ),
      title: Text(
        LocaleKeys.home_good_morning.tr(),
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: AppColors.grayscale400,
          height: 1.4,
        ),
      ),
      subtitle: BlocBuilder<HomeHeaderCubit, HomeHeaderState>(
        builder: (context, state) {
          return UserNameSubtitle(state: state);
        },
      ),
      trailing: const CircleAvatar(
        radius: 24,
        backgroundColor: AppColors.green1_50,
        child: BuildOptimizedSvg(assetPath: AppIcons.notification),
      ),
    );
  }
}
