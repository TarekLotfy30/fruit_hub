import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/constants/app_constant.dart';
import '../../../../core/constants/app_padding.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/helpers/app_navigation.dart';
import '../../../../core/helpers/app_spacing.dart';
import '../../../../core/routing/app_routes_name.dart';
import '../../../../core/translation/locale_keys.g.dart';
import '../../../../core/utils/colors/app_colors.dart';
import '../../../../core/widgets/build_optimized_svg.dart';
import '../../controller/onboarding_cubit.dart';
import '../../data/models/onboarding_model.dart';

part '../widgets/build_action_button.dart';
part '../widgets/build_page_indicator.dart';
part '../widgets/build_page_view.dart';
part '../widgets/onboarding_view_body.dart';
part '../widgets/page_view_item.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _OnboardingViewBody());
  }
}
