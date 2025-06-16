import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../cubits/bloc_observer.dart';

/// Initialize all required services
///
/// This includes Firebase, SharedPreferences, DioHelper and
/// location permissions
Future<void> initServices() async {
  log('Initializing services...', name: 'info');

  //Initialize BLoC observer
  Bloc.observer = MyBlocObserver();
  log('BLoC observer initialized');

  // Initialize EasyLocalization before running the app
  await EasyLocalization.ensureInitialized();

  // Initialize Firebase
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // log('Firebase initialized');

  // Initialize Firebase Messaging
  // await initFirebaseMessaging();
  // log('FirebaseMessaging initialized');

  // Initialize SharedPreferences
  // await SharedHelper.init();
  // log('SharedPreferences initialized', name: 'info');

  // Initialize DioHelper
  // await DioHelper.initialize();
  // log('DioHelper initialized');

  // Initialize location services
  // await initLocationServices();
}

// /// Register dependencies with GetIt service locator
// void registerDependencies() {
//   logger.info('Registering dependencies...');

//   // Register DioHelper as a singleton
//   if (!getIt.isRegistered<DioHelper>()) {
//     getIt.registerSingleton<DioHelper>(DioHelper());
//     logger.fine('DioHelper registered as singleton');
//   }

//   // Register LocalHelper as a singleton
//   if (!getIt.isRegistered<LocalHelper>()) {
//     getIt.registerSingleton<LocalHelper>(LocalHelper());
//     logger.fine('LocalHelper registered as singleton');
//   }

//   // Register other services here
// }
