import 'dart:developer';
import 'package:flutter/material.dart';

import 'app/fruit_hub_app.dart';
import 'core/helpers/functions/configure_system_ui.dart';

void main() {
  try {
    // Initialize Flutter binding before calling native code
    WidgetsFlutterBinding.ensureInitialized();

    // Configure system UI
    configureSystemUI();

    // Initialize services
    // await initServices();
    // Initialize BLoC observer
    // Bloc.observer = MyBlocObserver();
    // log('BLoC observer initialized');
    // Register service locator dependencies
    // registerDependencies();
    //     void runLocalizedApp() {
    //   logger.info('Running localized app...');

    //   runApp(
    //     EasyLocalization(
    //       supportedLocales: const [Locale('en'), Locale('ar')],
    //       path: 'assets/translations',
    //       fallbackLocale: const Locale('en'),
    //       child: const MyApp(),
    //     ),
    //   );
    // }
    runApp(const FruitHubApp());
    log('Application started successfully');
  } on Exception catch (e, stackTrace) {
    log('Failed to initialize application', error: e, stackTrace: stackTrace);
  }
}
