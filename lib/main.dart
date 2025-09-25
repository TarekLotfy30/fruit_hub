import 'dart:developer';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'app/fruit_hub_app.dart';
import 'core/constants/app_assets.dart';
//import 'core/di/service_locator.dart';
import 'core/helpers/functions/configure_system_ui.dart';
import 'core/helpers/functions/init_services.dart';
//import 'core/services/local/local_helper.dart';

Future<void> main() async {
  // Initialize Flutter binding before calling native code
  WidgetsFlutterBinding.ensureInitialized();

  // Configure system UI & Initialize services
  await configureSystemUI();
  await initializeServices();
  //await getIt<LocalHelper>().clearAll();
  runApp(
    EasyLocalization(
      ignorePluralRules: false,
      supportedLocales: const [
        Locale('en', 'US'), // English (United States)
        Locale('ar', 'SA'), // Arabic
      ],
      path: AppAssets.translationsPath,
      fallbackLocale: const Locale('ar', 'SA'),
      startLocale: const Locale('ar', 'SA'),
      child: DevicePreview(
        enabled: false, //kReleaseMode,
        builder: (context) {
          return const FruitHubApp();
        },
      ),
    ),
  );

  log('Application started successfully', name: 'main');
}



// I make a new branch called new-development- feature to work on it
// now i will push it to github
// i will add something to test on it and push it to github
//  add splash screen UI
// adjust splash screen logo size
