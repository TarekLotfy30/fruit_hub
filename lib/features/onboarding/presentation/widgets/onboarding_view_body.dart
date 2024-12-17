import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors/app_colors.dart';
import '../../../../core/theming/typography/app_text_style.dart';
import '../../../../core/widgets/app_button_custom.dart';
import '../../../../core/widgets/app_text_custom.dart';
import '../../logic/onboarding_cubit.dart';
import 'onboarding_custom_widget.dart';

part 'onboarding_indicator.dart';
part 'onboarding_pages.dart';
part 'skip_button.dart';
part 'start_button.dart';

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
          Expanded(
            child: Column(
              children: [
                Stack(
                  children: [
                    _OnboardingPages(onboardingCubit: onboardingCubit),
                    BlocBuilder<OnboardingCubit, OnboardingState>(
                      builder: (context, state) {
                        return Visibility(
                          visible: onboardingCubit.cubitIndex == 0,
                          child: const _SkipButton(),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                BlocBuilder<OnboardingCubit, OnboardingState>(
                  builder: (context, state) {
                    return _OnboardingIndicator(
                      onboardingCubit: onboardingCubit,
                    );
                  },
                ),
              ],
            ),
          ),
          BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              return Visibility(
                visible: onboardingCubit.cubitIndex == 1,
                child: const _StartButton(),
              );
            },
          ),
        ],
      ),
    );
  }
}
