import 'package:easy_localization/easy_localization.dart';

import '../../features/onboarding/data/models/onboarding_model.dart';
import '../translation/locale_keys.g.dart';
import 'app_assets.dart';

class AppConstant {
  AppConstant._();

  static final List<OnboardingModel> onboardingItems = [
    OnboardingModel(
      titleTextSpan1: '${LocaleKeys.onboarding_welcome.tr()} ',
      titleTextSpan2: LocaleKeys.app_fruit.tr(),
      titleTextSpan3: LocaleKeys.app_hub.tr(),
      subTitle: LocaleKeys.onboarding_explore_fruits.tr(),
      image: AppAssets.fruitBasket,
      backgroundImage: AppAssets.orangeBackground,
      isLast: false,
    ),
    OnboardingModel(
      title: LocaleKeys.onboarding_search_and_shopping.tr(),
      subTitle: LocaleKeys.onboarding_provide_service.tr(),
      image: AppAssets.pineapple,
      backgroundImage: AppAssets.greenBackground,
      isLast: true,
    ),
  ];
}
