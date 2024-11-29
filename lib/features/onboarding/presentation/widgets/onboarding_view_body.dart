import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/theming/colors/app_colors.dart';
import 'package:fruit_hub/core/widgets/app_button_custom.dart';
import 'package:fruit_hub/core/widgets/app_text_custom.dart';
import 'package:fruit_hub/features/onboarding/logic/onboarding_cubit.dart';
import 'package:fruit_hub/features/onboarding/presentation/widgets/onboarding_custom_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/theming/typography/text_style.dart';

part 'build_page_indicator.dart';
part 'build_page_view.dart';
part 'build_start_button.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final onboardingCubit = OnboardingCubit.get(context); // Accessing Cubit
    return SafeArea(
      child: Column(
        children: [
          _BuildPageView(onboardingCubit: onboardingCubit),
          const SizedBox(height: 16),
          _BuildPageIndicator(onboardingCubit: onboardingCubit),
          const SizedBox(height: 30),
          _BuildStartButton(onboardingCubit: onboardingCubit),
        ],
      ),
    );
  }
}
