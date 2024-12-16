import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors/app_colors.dart';
import '../../../../core/theming/typography/text_style.dart';
import '../../../../core/widgets/app_button_custom.dart';
import '../../../../core/widgets/app_text_custom.dart';
import '../../logic/onboarding_cubit.dart';
import '../widgets/onboarding_custom_widget.dart';

part '../widgets/build_start_button.dart';

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
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.72,
                      ),
                      child: PageView.builder(
                        itemBuilder: (context, index) => OnboardingWidget(
                          onboardingModel:
                              onboardingCubit.onboardingPages[index],
                          onboardingCubit: onboardingCubit,
                        ),
                        controller: onboardingCubit.boardController,
                        itemCount: onboardingCubit.onboardingPages.length,
                        onPageChanged: onboardingCubit.showButton,
                      ),
                    ),
                    BlocBuilder<OnboardingCubit, OnboardingState>(
                      builder: (context, state) {
                        return Visibility(
                          visible: onboardingCubit.cubitIndex == 0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 20,
                            ),
                            child: TextButton(
                              onPressed: () async {
                                context.removeAllAndNavigateToNamedRoute(
                                  Routes.loginScreen,
                                  predicate: (route) => false,
                                );
                              },
                              child: AppText(
                                text: 'تخط',
                                style: AppStyles.textStyle13
                                    .copyWith(color: AppColors.primaryColor),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                BlocBuilder<OnboardingCubit, OnboardingState>(
                  builder: (context, state) {
                    return SmoothPageIndicator(
                      controller: onboardingCubit.boardController,
                      count: onboardingCubit.onboardingPages.length,
                      effect: WormEffect(
                        spacing: 11,
                        radius: 11,
                        dotWidth: 16,
                        dotHeight: 16,
                        dotColor: onboardingCubit.cubitIndex == 1
                            ? AppColors.primaryColor
                            : AppColors.primaryColor.withOpacity(0.4),
                        activeDotColor: AppColors.primaryColor,
                      ),
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
                replacement: const SizedBox(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  child: AppButton(
                    onPressed: () async {
                      context.removeAllAndNavigateToNamedRoute(
                        Routes.loginScreen,
                        predicate: (route) => false,
                      );
                    },
                    buttonText: 'ابدأ الان',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
