import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/di/service_locator.dart';
import '../core/responsive/app_screen_util.dart';
import '../core/routing/app_router.dart';
import '../core/routing/routes_name.dart';
import '../core/services/local/app_shared_keys.dart';
import '../core/services/local/local_helper.dart';
import '../core/theme/app_theme.dart';

class FruitHubApp extends StatelessWidget {
  const FruitHubApp({super.key});

  String getInitialRoute() {
    final LocalHelper localHelper = getIt<LocalHelper>();
    final isExist = localHelper.exists(key: AppSharedKey.skipOnBoarding);

    if (isExist) {
      return RoutesName.loginScreen;
    } else {
      return RoutesName.onboardingScreen;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppScreenUtil.designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        // Configure localization delegates from EasyLocalization
        localizationsDelegates: context.localizationDelegates,
        // Set supported locales from EasyLocalization
        supportedLocales: context.supportedLocales,
        // Set current locale from EasyLocalization
        locale: context.locale,

        initialRoute: getInitialRoute(),
        onGenerateRoute: AppRouter().generateRoute,
        theme: AppTheme.lightMode,
        darkTheme: AppTheme.darkMode,
        themeMode: ThemeMode.light,
      ),
    );
  }
}

//flutter pub run easy_localization:generate -S assets/translations -O lib/core/translation -o locale_keys.g.dart -f keys
