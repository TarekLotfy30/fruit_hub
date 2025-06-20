import 'package:easy_localization/easy_localization.dart';

import '../../features/onboarding/data/models/onboarding_model.dart';
import '../translation/locale_keys.g.dart';
import 'app_assets.dart';

class AppConstant {
  AppConstant._();

  static List<OnboardingModel> onboardingItems = [
    OnboardingModel(
      titleTextSpan1: '${LocaleKeys.welcome.tr()} ',
      titleTextSpan2: LocaleKeys.fruit.tr(),
      titleTextSpan3: LocaleKeys.hub.tr(),
      subTitle: LocaleKeys.explore_fruits.tr(),
      image: AppAssets.fruitBasket,
      backgroundImage: AppAssets.orangeBackground,
      isLast: false,
    ),
    OnboardingModel(
      title: LocaleKeys.search_and_shopping.tr(),
      subTitle: LocaleKeys.provide_service.tr(),
      image: AppAssets.pineapple,
      backgroundImage: AppAssets.greenBackground,
      isLast: true,
    ),
  ];
}
