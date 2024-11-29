import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/theming/colors/app_colors.dart';
import 'package:fruit_hub/core/theming/typography/text_style.dart';
import 'package:fruit_hub/core/widgets/app_text_custom.dart';
import 'package:fruit_hub/features/onboarding/data/onboarding_model.dart';
import 'package:fruit_hub/features/onboarding/logic/onboarding_cubit.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.onboardingModel,
    required this.onboardingCubit,
  });

  final OnboardingModel onboardingModel;
  final OnboardingCubit onboardingCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  onboardingModel.background,
                  semanticsLabel: 'background',
                  fit: BoxFit.fill,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  onboardingModel.image,
                  fit: BoxFit.cover,
                ),
              ),
              BlocBuilder<OnboardingCubit, OnboardingState>(
                builder: (context, state) {
                  return Visibility(
                    visible: onboardingCubit.cubitIndex == 0,
                    replacement: const SizedBox(),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        child: TextButton(
                          onPressed: () async {
                            onboardingCubit.boardController.nextPage(
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.fastLinearToSlowEaseIn,
                            );
                          },
                          child: AppText(
                            text: 'تخط',
                            style: AppStyles.textStyle13
                                .copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        if (onboardingModel.isThereSpan)
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                  text: 'Fruit',
                  style: AppStyles.textStyle23
                      .copyWith(color: AppColors.primaryColor),
                ),
                TextSpan(
                  text: 'HUB ',
                  style: AppStyles.textStyle23
                      .copyWith(color: AppColors.secondaryColor),
                ),
                const TextSpan(
                  text: 'مرحبًا بك في  ',
                  style: AppStyles.textStyle23,
                ),
              ],
            ),
          )
        else
          const AppText(
            text: 'ابحث وتسوق',
            style: AppStyles.textStyle23,
          ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 39),
          child: AppText(
            text: onboardingModel.description,
            style: AppStyles.textStyle13.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.darkGray,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
