import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/di/service_locator.dart';
import '../core/responsive/app_screen_util.dart';
import '../core/routing/app_router.dart';
import '../core/routing/app_routes_name.dart';
import '../core/services/local/app_shared_keys.dart';
import '../core/services/local/local_helper.dart';
import '../core/theme/app_theme.dart';

/// The main application widget that configures the app environment.
///
/// This widget sets up:
/// - Screen size adaptation with ScreenUtilInit
/// - State management with BlocProvider
/// - Localization with EasyLocalization
/// - Theme configuration
/// - Navigation to the initial screen (SplashScreen)

class FruitHubApp extends StatelessWidget {
  const FruitHubApp({super.key});

  String _getInitialRoute() {
    final localHelper = getIt<LocalHelper>();

    final skipOnboarding =
        localHelper.getValue(key: AppSharedKey.skipOnBoarding) ?? false;

    if (skipOnboarding) {
      return AppRoutesName.signInScreen;
    } else {
      return AppRoutesName.onboardingScreen;
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

        initialRoute: _getInitialRoute(),
        onGenerateRoute: AppRouter.generateRoute,

        // Theme configuration
        theme: AppTheme.lightMode,
        darkTheme: AppTheme.darkMode,
        themeMode: ThemeMode.light,
      ),
    );
  }
}

//flutter pub run easy_localization:generate -S assets/translations -O lib/core/translation -o locale_keys.g.dart -f keys
