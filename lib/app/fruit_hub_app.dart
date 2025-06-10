import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/responsive/app_screen_util.dart';
import '../core/theme/app_theme.dart';
import '../features/splash_screen/presentation/screens/splash_screen.dart';

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
        theme: AppTheme.lightMode,
        darkTheme: AppTheme.darkMode,
        themeMode: ThemeMode.light,
        title: 'Fruit Hub',
        home: const SplashScreen(),
      ),
    );
  }
}
