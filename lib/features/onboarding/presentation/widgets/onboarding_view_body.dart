import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/constants/app_constant.dart';
import '../../../../core/constants/app_padding.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/helpers/functions/app_navigation.dart';
import '../../../../core/helpers/functions/app_spacing.dart';
import '../../../../core/routing/routes_name.dart';
import '../../../../core/translation/locale_keys.g.dart';
import '../../../../core/utils/colors/app_colors.dart';
import '../../../../core/widgets/build_optimized_svg.dart';
import '../../controller/onboarding_cubit.dart';
import '../../data/models/onboarding_model.dart';

part '../widgets/build_action_button.dart';
part '../widgets/build_page_indicator.dart';
part '../widgets/build_page_view.dart';
part '../widgets/page_view_item.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();
    final onboardingItems = AppConstant.onboardingItems;
    final theme = Theme.of(context);
    return Column(
      children: [
        // Main PageView - handles scrolling between pages & Skip Button
        Expanded(
          child: _BuildPageView(
            cubit: cubit,
            onboardingItems: onboardingItems,
            theme: theme,
          ),
        ),

        // Page indicator - shows current page progress
        _BuildPageIndicator(
          cubit: cubit,
          onboardingItems: onboardingItems,
          theme: theme,
        ),

        verticalSpacing(Spacing.spacing32),

        // Action button - Start button based on current page
        Padding(
          padding: EdgeInsets.all(AppPaddings.padding20.w),
          child: _BuildActionButton(cubit: cubit),
        ),

        verticalSpacing(Spacing.spacing8),
      ],
    );
  }
}
