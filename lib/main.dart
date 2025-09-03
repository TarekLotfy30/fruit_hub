import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'app/fruit_hub_app.dart';
import 'core/constants/app_assets.dart';
import 'core/helpers/functions/configure_system_ui.dart';
import 'core/helpers/functions/init_services.dart';

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
      child: const FruitHubApp(),
    ),
  );

  log('Application started successfully', name: 'main');
}
