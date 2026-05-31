import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/repo/auth_repo.dart';
import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../../features/splash/data/repo/splash_repo.dart';
import '../../features/splash/data/repo/splash_repo_impl.dart';
import '../../features/splash/data/use_case/splash_use_case.dart';
import '../services/firebase/firebase_auth_service.dart';
import '../services/firebase/firestore_service.dart';
import '../services/local/local_helper.dart';

// registerSingleton: This method registers a type as a singleton, meaning that
// the instance is created immediately when the application starts. Every time
// you request this type, you’ll get the same instance throughout the app’s
// lifecycle.

// registerLazySingleton: Similar to registerSingleton, this method registers a
// type as a singleton as well. However, the instance is not created
// immediately. Instead, it is created the first time it is requested. This
// lazy initialization is generally used to save resources and memory, as it
// delays the creation of the instance until it is actually needed.

/// Sets up the service locator by registering all necessary dependencies.
///
/// This function initializes and registers dependencies such as Dio, DioHelper,
/// SharedPreferences, LocalHelper, and repositories. It uses a combination of
/// singleton and async singleton registrations to
/// ensure efficient resource usage.
/// The setup is wrapped in error handling to catch and log any issues during
/// initialization.

/// The global instance of GetIt for dependency injection.
final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  try {
    // SharedPreferences
    final sharedPrefs = await SharedPreferences.getInstance();
    getIt
      ..registerSingleton<SharedPreferences>(sharedPrefs)
      ..registerSingleton<LocalHelper>(LocalHelper(sharedPrefs))
      // Services
      ..registerSingleton<FirebaseAuthService>(FirebaseAuthService())
      ..registerSingleton<FirestoreService>(FirestoreService())
      // repos
      ..registerLazySingleton<SplashRepo>(
        () => SplashRepoImpl(getIt<LocalHelper>()),
      )
      ..registerLazySingleton<AuthRepo>(
        () => AuthRepoImpl(
          authService: getIt<FirebaseAuthService>(),
          firestoreService: getIt<FirestoreService>(),
          localHelper: getIt<LocalHelper>(),
        ),
      )
      ..registerLazySingleton<HomeRepo>(
        () => HomeRepoImpl(getIt<LocalHelper>()),
      )
      // Use cases
      ..registerLazySingleton<SplashUseCase>(
        () => SplashUseCase(getIt<SplashRepo>()),
      );
  } catch (e, stackTrace) {
    log(
      '❌ Failed to initialize service locator: $e',
      name: 'ServiceLocator',
      error: e,
      stackTrace: stackTrace,
    );
    rethrow;
  }
}
