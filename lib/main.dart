import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/helpers/observer.dart';
import 'core/routing/app_router.dart';
import 'core/services/local/shared_preferences.dart';
import 'core/theming/colors/app_colors.dart';
import 'fruit_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedHelper.init();
  //SharedHelper.clearAllData();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.primaryColor, // navigation bar color
      statusBarColor: AppColors.primaryColor, // status bar color
      statusBarIconBrightness: Brightness.light, // status bar icons' color
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (_) => runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('ar'),
        child: DevicePreview(
          enabled: false,
          builder: (context) => FruitApp(
            appRouter: AppRouter(),
          ),
        ),
      ),
    ),
  );
}
