import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/colors/app_colors.dart';
import '../../../../core/theming/typography/app_text_style.dart';
import '../../../../core/widgets/app_text_custom.dart';
import '../../data/onboarding_model.dart';
import '../../logic/onboarding_cubit.dart';

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
                const TextSpan(
                  text: 'مرحبًا بك في ',
                  style: AppTextStyles.textStyle23,
                ),
                TextSpan(
                  text: 'Fruit',
                  style: AppTextStyles.textStyle23
                      .copyWith(color: AppColors.primaryColor),
                ),
                TextSpan(
                  text: 'HUB',
                  style: AppTextStyles.textStyle23
                      .copyWith(color: AppColors.secondaryColor),
                ),
              ],
            ),
          )
        else
          const AppText(
            text: 'ابحث وتسوق',
            style: AppTextStyles.textStyle23,
          ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 39),
          child: AppText(
            text: onboardingModel.description,
            style: AppTextStyles.textStyle13.copyWith(
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
