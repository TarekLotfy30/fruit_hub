import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/images.dart';
import '../../../core/services/local/shared_keys.dart';
import '../../../core/services/local/shared_preferences.dart';
import '../data/onboarding_model.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  /// Access the [OnboardingCubit] instance from the widget tree.
  static OnboardingCubit get(BuildContext context) =>
      BlocProvider.of<OnboardingCubit>(context);

  /// List of onboarding pages with corresponding data.
  PageController boardController = PageController();

  /// List of onboarding pages with corresponding data.
  List<OnboardingModel> onboardingPages = [
    OnboardingModel(
      image: AppImages.fruitBasket,
      description: '''
اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.''',
      background: AppImages.backgroundOrange,
      isThereSpan: true,
    ),
    OnboardingModel(
      image: AppImages.pineapple,
      description: '''
نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية''',
      background: AppImages.backgroundGreen,
      isThereSpan: false,
    ),
  ];

  /// Current index of the onboarding page.
  int cubitIndex = 0;

  /// Updates the current page index and emits a corresponding state.
  /// Shows the button only on the last page.
  void showButton(int index) {
    cubitIndex = index;

    if (cubitIndex == onboardingPages.length - 1) {
      emit(ShowButton());
    } else {
      emit(DontShowButton());
    }
  }

  Future<void> finishOnboarding() async {
    SharedHelper.set(key: SharedKeys.onboardingIsDone, value: true);
  }

  /// Dispose resources like [PageController] to avoid memory leaks.
  @override
  Future<void> close() {
    boardController.dispose();
    return super.close();
  }
}
