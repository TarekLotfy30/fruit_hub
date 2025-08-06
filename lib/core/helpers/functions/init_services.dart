import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../di/service_locator.dart';
import 'bloc_observer.dart';

/// Initialize all required services
///
/// This includes Firebase, SharedPreferences, DioHelper and
/// location permissions
Future<void> initializeServices() async {
  log('Initializing services...', name: 'initServices');

  //Initialize BLoC observer
  Bloc.observer = MyBlocObserver();
  log('BLoC observer initialized', name: 'initServices');

  await Future.wait([
    // Initialize EasyLocalization before running the app
    EasyLocalization.ensureInitialized(),
    setupServiceLocator(),
  ]);
  log('setupServiceLocator initialized', name: 'initServices');

  // Initialize Firebase
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // log('Firebase initialized');

  // Initialize Firebase Messaging
  // await initFirebaseMessaging();
  // log('FirebaseMessaging initialized');

  // Initialize DioHelper
  // await DioHelper.initialize();
  // log('DioHelper initialized');

  // Initialize location services
  // await initLocationServices();
}
