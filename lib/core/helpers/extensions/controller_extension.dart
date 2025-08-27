import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/onboarding/controller/onboarding_cubit.dart';
import '../../cubits/localization_cubit/localization_cubit.dart';

extension ControllerExtension on BuildContext {
  OnboardingCubit get onboardingCubit => read<OnboardingCubit>();
  LocalizationCubit get localizationCubit => read<LocalizationCubit>();
}
