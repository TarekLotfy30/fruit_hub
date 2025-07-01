import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constant.dart';
import '../../../../core/services/local/shared_keys.dart';
import '../../../../core/services/local/shared_preferences.dart';
import '../../../../core/di/service_locator.dart';
import 'onboarding.state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingInitial());

  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true, // Maintain page state during rebuilds
    viewportFraction: 1,
  );

  PageController get pageController => _pageController;

  void changePage(int index) {
    if (index == AppConstant.onboardingItems.length - 1) {
      emit(OnboardingChanged(isLastPage: true, pageIndex: index));
    }
  }

  Future<void> skipandSave() async {
    await getIt<LocalHelper>().setValue(
      key: AppSharedKey.skipOnBoarding,
      value: true,
    );
  }

  /// Disposes of resources when cubit is closed
  ///
  /// **Performance**: O(1) - cleanup operation
  @override
  Future<void> close() {
    // Dispose page controller to prevent memory leaks
    _pageController.dispose();

    return super.close();
  }
}
