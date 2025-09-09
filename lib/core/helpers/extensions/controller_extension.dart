import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/auth/controller/sign_in/sign_in_cubit.dart';
import '../../../features/auth/controller/sign_out/sign_out_cubit.dart';
import '../../../features/auth/controller/sign_up/sign_up_cubit.dart';
import '../../../features/onboarding/controller/onboarding_cubit.dart';
import '../../cubits/theme_cubit/theme_cubit.dart';

/// Accessor for various Cubits used in the application.
/// This extension provides a convenient way to access Cubits from
/// a BuildContext, making it easier to manage and coordinate
/// state updates across  different parts of the application.
extension ControllerExtension on BuildContext {
  //------------------------------Onboarding-------------------------------
  OnboardingCubit get onboardingCubit => read<OnboardingCubit>();
  //------------------------------Auth--------------------------------------
  SignUpCubit get signUpCubit => read<SignUpCubit>();
  SignInCubit get signInCubit => read<SignInCubit>();
  SignOutCubit get signOutCubit => read<SignOutCubit>();
  //------------------------------Theme-------------------------------------
  ThemeCubit get themeCubit => read<ThemeCubit>();
}
