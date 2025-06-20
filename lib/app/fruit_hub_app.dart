import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/responsive/app_screen_util.dart';
import '../core/routing/app_router.dart';
import '../core/routing/routes_name.dart';
import '../core/theme/app_theme.dart';

class FruitHubApp extends StatelessWidget {
  const FruitHubApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppScreenUtil.designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        // Configure localization delegates from EasyLocalization
        localizationsDelegates: context.localizationDelegates,
        // Set supported locales from EasyLocalization
        supportedLocales: context.supportedLocales,
        // Set current locale from EasyLocalization
        initialRoute: RoutesName.splashScreen,

        onGenerateRoute: AppRouter().generateRoute,
        locale: context.locale,
        theme: AppTheme.lightMode,
        darkTheme: AppTheme.darkMode,
        themeMode: ThemeMode.light,
        home: child,
      ),
    );
  }
}

//flutter pub run easy_localization:generate -S assets/translations -O lib/core/translation -o locale_keys.g.dart -f keys
