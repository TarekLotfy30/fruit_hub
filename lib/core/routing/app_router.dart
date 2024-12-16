// da ely ha3ml feh el routing beta3 el screens

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/screen/login_view.dart';
import '../../features/onboarding/logic/onboarding_cubit.dart';
import '../../features/onboarding/presentation/screen/onboarding_view.dart';
import '../../features/splash/presentation/screens/splash_view.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return _buildRoute(const SplashView());
      case Routes.onboardingScreen:
        return _buildRoute(
          BlocProvider(
            create: (context) => OnboardingCubit(),
            child: const OnboardingView(),
          ),
        );
      case Routes.loginScreen:
        return _buildRoute(
          const LoginView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  MaterialPageRoute _buildRoute(Widget child) {
    return MaterialPageRoute(builder: (context) => child);
  }

// TODO(tarek): the transtions between the pages
}
