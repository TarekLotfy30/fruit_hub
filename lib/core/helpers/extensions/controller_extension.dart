import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/auth/controller/sign_up/sign_up_cubit.dart';
import '../../../features/onboarding/controller/onboarding_cubit.dart';

import '../../cubits/theme_cubit/theme_cubit.dart';

extension ControllerExtension on BuildContext {
  OnboardingCubit get onboardingCubit => read<OnboardingCubit>();
  SignUpCubit get signUpCubit => read<SignUpCubit>();

  ThemeCubit get themeCubit => read<ThemeCubit>();
}
