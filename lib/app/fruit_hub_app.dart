import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/cubits/theme_cubit/theme_cubit.dart';
import '../core/routing/app_router.dart';
import '../core/routing/app_routes_name.dart';
import '../core/theme/app_theme.dart';

class FruitHubApp extends StatelessWidget {
  const FruitHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) => MultiBlocProvider(
        providers: [BlocProvider(create: (_) => ThemeCubit())],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              //showPerformanceOverlay: true,
              // Configure localization delegates from EasyLocalization
              localizationsDelegates: context.localizationDelegates,
              // Set supported locales from EasyLocalization
              supportedLocales: context.supportedLocales,
              // Set current locale from EasyLocalization
              locale: context.locale,
              // DevicePreview configuration
              // locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              // Routing configuration
              initialRoute: AppRoutesName.splashScreen,
              onGenerateRoute: AppRouter.generateRoute,
              // Theme configuration
              theme: AppTheme.lightMode,
              // darkTheme: AppTheme.darkMode,
              // themeMode: themeState.mode,
            );
          },
        ),
      ),
    );
  }
}

// flutter pub run easy_localization:generate -S assets/translations -O lib/core/translation -o locale_keys.g.dart -f keys

// tarektest123@gmail.com
// Qweasd@123456
