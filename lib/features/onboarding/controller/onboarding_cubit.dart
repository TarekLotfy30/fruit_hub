import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/services/local/app_shared_keys.dart';
import '../../../../core/services/local/local_helper.dart';
import '../../../core/constants/app_constant.dart';

part 'onboarding.state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());


  void changePage(int index) {
    if (index == AppConstant.onboardingItems.length - 1) {
      emit(OnboardingChanged());
    }
  }

  Future<void> skipAndSave() async {
    await getIt<LocalHelper>().setValue(
      key: AppSharedKey.skipOnBoarding,
      value: true,
    );
  }
}
