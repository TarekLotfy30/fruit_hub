import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/screens/login_view.dart';
import '../../features/onboarding/logic/cubit/onboarding_cubit.dart';

import '../../features/onboarding/presentation/screens/onboarding_view.dart';
import 'routes_name.dart';

/// Centralized router for handling all navigation within the application.
/// Uses named routes with arguments and provides custom transition animations.
class AppRouter {
  static const String _logTag = 'APP_ROUTER';

  /// Generates a route based on the provided [settings].
  /// Handles all possible routes in the application with proper type checking,
  /// dependency injection, and error handling.

  Route<dynamic> generateRoute(RouteSettings settings) {
    log(
      '🌐 Navigating to: ${settings.name}',
      name: _logTag,
      error: settings.arguments?.toString(),
    );

    try {
      switch (settings.name) {
        case RoutesName.onboardingScreen:
          return buildRoute(
            BlocProvider(
              create: (context) => OnboardingCubit(),
              child: const OnboardingView(),
            ),
          );
        case RoutesName.loginScreen:
          return buildRoute(const LoginView());
        default:
          return buildRoute(_buildErrorRoute(error: 'Route not found'));
      }
    } on Exception catch (e, stackTrace) {
      log(
        '🚨 Route generation error: $e',
        name: _logTag,
        error: e,
        stackTrace: stackTrace,
      );
      return buildRoute(_buildErrorRoute(error: e));
    }
  }

  MaterialPageRoute<dynamic> buildRoute(Widget child) =>
      MaterialPageRoute(builder: (_) => child);

  /// Builds an error route when route generation fails
  Widget _buildErrorRoute({dynamic error}) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigation Error')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Failed to generate route:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              error.toString(),
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/*
Example Usage in Main App:

void main() {
  // Initialize dependencies
  DioHelper.init();
  setupServiceLocator();

  runApp(
    RickAndMortyApp(
      appRouter: AppRouter(),
    ),
  );
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: MyRouteInformationParser(),
      routerDelegate: MyRouterDelegate(appRouter: appRouter),
       Or use the traditional way:
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
*/



  /// Handles the book details route with proper argument validation
  // Route<dynamic> _handleBookDetailsRoute(dynamic arguments) {
  //   if (arguments is! BookModel) {
  //     developer.log(
  //       '⚠️ Invalid arguments for book details route',
  //       name: _logTag,
  //       level: developer.Level.warning,
  //     );
  //     return _buildAnimatedRoute(const HomeScreen());
  //   }

  //   final bookModel = arguments as BookModel;
  //   final category = bookModel.volumeInfo?.categories?.isNotEmpty ?? false
  //       ? bookModel.volumeInfo!.categories!.first
  //       : 'Unknown';

  //   return _buildAnimatedRoute(
  //     BlocProvider(
  //       create: (context) => SimilarBooksCubit(
  //         getIt.get<HomeRepoImpl>(),
  //       )..getSimilarBooks(category: category),
  //       child: BookDetailsScreen(book: bookModel),
  //     ),
  //     animationType: NavigationAnimationType.slideFade,
  //   );
  // }
