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
import '../../data/models/onboarding_model.dart';
import '../../logic/cubit/onboarding.state.dart';
import '../../logic/cubit/onboarding_cubit.dart';

part '../widgets/build_page_view.dart';
part '../widgets/build_page_indicator.dart';
part '../widgets/build_action_button.dart';
part '../widgets/page_view_item.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        children: [
          // Main PageView - handles scrolling between pages & Skip Button
          const Expanded(child: _BuildPageView()),

          // Page indicator - shows current page progress
          const _BuildPageIndicator(),

          verticalSpacing(Spacing.spacing32),

          // Action button - Start button based on current page
          Padding(
            padding: EdgeInsets.all(AppPaddings.padding20.w),
            child: const _BuildActionButton(),
          ),

          verticalSpacing(Spacing.spacing8),
        ],
      ),
    );
  }
}
