import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/screens/forget_password_view.dart';
import '../../features/auth/presentation/screens/sign_in_view.dart';
import '../../features/auth/presentation/screens/sign_up_view.dart';
import '../../features/onboarding/controller/onboarding_cubit.dart';
import '../../features/onboarding/presentation/screens/onboarding_view.dart';
import 'app_routes_name.dart';

/// Centralized router for handling all navigation within the application.
/// Uses named routes with arguments and provides custom transition animations.
abstract final class AppRouter {
  AppRouter._();

  static const String _logTag = 'APP_ROUTER';

  /// Generates a route based on the provided [settings].
  /// Handles all possible routes in the application with proper type checking,
  /// dependency injection, and error handling.
  /// Main route generator method
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    log(
      '🌐 Navigating to: ${settings.name}',
      name: _logTag,
      error: settings.arguments?.toString(),
    );
    switch (settings.name) {
      case AppRoutesName.onboardingScreen:
        return _buildRoute(
          BlocProvider(
            create: (context) => OnboardingCubit(),
            child: const OnboardingView(),
          ),
        );
      case AppRoutesName.signInScreen:
        return _buildFadeRoute(const SignInView());
      case AppRoutesName.signUpScreen:
        return _buildFadeRoute(const SignUpView());
      case AppRoutesName.forgetPasswordScreen:
        return _buildFadeRoute(const ForgetPasswordView());
      default:
        return null;
    }
  }

  /// Build route with custom page transition
  static PageRoute<T> _buildRoute<T extends Object?>(
    Widget child, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: animation.drive(
            Tween(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.easeInOut)),
          ),
          child: child,
        );
      },
    );
  }

  /// Build fade transition route

  static PageRoute<T> _buildFadeRoute<T extends Object?>(
    Widget child, {
    RouteSettings? settings,
  }) {
    return PageRouteBuilder<T>(
      settings: settings,
      opaque: false,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      barrierLabel: '',
      maintainState: false,
      fullscreenDialog: false,
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
