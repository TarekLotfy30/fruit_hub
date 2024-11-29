// da ely ha3ml feh el routing beta3 el screens

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/features/onboarding/logic/onboarding_cubit.dart';
import 'package:fruit_hub/features/onboarding/presentation/screen/onboarding_view.dart';
import 'package:fruit_hub/features/splash/presentation/screens/splash_view.dart';

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
