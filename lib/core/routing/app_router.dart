import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/controller/sign_up/sign_up_cubit.dart';
import '../../features/auth/data/repo/auth_repo.dart';
import '../../features/auth/presentation/screens/forget_password_view.dart';
import '../../features/auth/presentation/screens/sign_in_view.dart';
import '../../features/auth/presentation/screens/sign_up_view.dart';
import '../../features/home/presentation/screens/home_view.dart';
import '../../features/onboarding/controller/onboarding_cubit.dart';
import '../../features/onboarding/presentation/screens/onboarding_view.dart';
import '../di/service_locator.dart';
import 'app_routes_name.dart';

// MaterialPageRoute → standard Material transition (slide in).

// CupertinoPageRoute → iOS-style transition.

// PageRouteBuilder → custom transitions.

/// Enum for different route transition types
enum RouteType { slide, fade, cupertinoSheet, scale, rotation }

/// Enum for slide directions
enum SlideDirection { rightToLeft, leftToRight, topToBottom, bottomToTop }

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
      // Onboarding flow
      case AppRoutesName.onboardingScreen:
        return _buildPlatformAwareRoute(
          BlocProvider(
            create: (context) => OnboardingCubit(),
            child: const OnboardingView(),
          ),
        );
      // Authentication flow
      case AppRoutesName.signInScreen:
        return _buildPlatformAwareRoute(
          BlocProvider(
            create: (context) => SignUpCubit(authRepo: getIt.get<AuthRepo>()),
            child: const SignInView(),
          ),
          forceRouteType: RouteType.slide,
        );
      case AppRoutesName.signUpScreen:
        return _buildPlatformAwareRoute(
          BlocProvider(
            create: (context) => SignUpCubit(authRepo: getIt.get<AuthRepo>()),
            child: const SignUpView(),
          ),
          forceRouteType: RouteType.cupertinoSheet,
        );
      case AppRoutesName.forgetPasswordScreen:
        return _buildPlatformAwareRoute(
          const ForgetPasswordView(),
          forceRouteType: RouteType.fade,
        );
      // Home flow
      case AppRoutesName.homeScreen:
        return _buildPlatformAwareRoute(const HomeView());
      default:
        return null;
    }
  }

  /// Builds a fade transition route
  ///
  /// Perfect for:
  /// - Authentication screens
  /// - Overlay-style transitions
  /// - Gentle screen changes
  static PageRoute<T> _buildFadeRoute<T extends Object?>(
    Widget child, {
    RouteSettings? settings,
    bool opaque = true,
    bool barrierDismissible = false,
    Color? barrierColor,
    Duration? transitionDuration,
  }) {
    return PageRouteBuilder<T>(
      settings: settings,
      opaque: opaque,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor ?? (opaque ? null : Colors.black26),
      barrierLabel: barrierDismissible ? 'Dismiss' : '',
      maintainState: true,
      transitionDuration:
          transitionDuration ?? const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          child: child,
        );
      },
    );
  }

  /// Builds a slide transition route (default Material Design style)
  ///
  /// Perfect for:
  /// - Main screen transitions
  /// - Forward navigation flow
  /// - Material Design compliance
  static PageRoute<T> _buildSlideRoute<T extends Object?>(
    Widget child, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    SlideDirection direction = SlideDirection.rightToLeft,
  }) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 250),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Define slide offset based on direction
        final Offset beginOffset = switch (direction) {
          SlideDirection.rightToLeft => const Offset(1, 0),
          SlideDirection.leftToRight => const Offset(-1, 0),
          SlideDirection.topToBottom => const Offset(0, -1),
          SlideDirection.bottomToTop => const Offset(0, 1),
        };
        final slideAnimation =
            Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic),
            );
        // Add subtle fade for smoother transition
        final fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0, 0.7, curve: Curves.easeOut),
          ),
        );
        return SlideTransition(
          position: slideAnimation,
          child: FadeTransition(opacity: fadeAnimation, child: child),
        );
      },
    );
  }

  /// Builds a Cupertino-style sheet route (iOS bottom sheet style)
  ///
  /// Perfect for:
  /// - Modal presentations
  /// - Forms and input screens
  /// - iOS-style user interactions
  /// - Settings and preferences
  ///
  /// Features:
  /// - Native iOS feel with proper spring physics
  /// - Dismissible with drag gesture
  /// - Proper barrier handling
  /// - Accessibility support
  static PageRoute<T> _buildCupertinoSheetRoute<T extends Object?>(
    Widget child, {
    RouteSettings? settings,
    bool barrierDismissible = true,
    Color? barrierColor,
    String? barrierLabel,
    bool maintainState = true,
    double? elevation,
  }) {
    return CupertinoPageRoute<T>(
      settings: settings,
      barrierDismissible: barrierDismissible,
      maintainState: maintainState,
      builder: (context) {
        return child;
      },
    );
  }

  /// Builds a scale transition route
  ///
  /// Perfect for:
  /// - Dialog-style presentations
  /// - Pop-up screens
  /// - Alert-style modals
  ///
  /// Time complexity: O(1), Space complexity: O(1)
  static PageRoute<T> _buildScaleRoute<T extends Object?>(
    Widget child, {
    RouteSettings? settings,
    bool barrierDismissible = false,
    Color? barrierColor,
    Duration? transitionDuration,
  }) {
    return PageRouteBuilder<T>(
      settings: settings,
      opaque: false,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor ?? Colors.black54,
      barrierLabel: 'Dismiss',
      maintainState: true,
      transitionDuration:
          transitionDuration ?? const Duration(milliseconds: 250),
      reverseTransitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack,
            reverseCurve: Curves.easeInBack,
          ),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
    );
  }

  /// Builds a rotation transition route
  ///
  /// Perfect for:
  /// - Creative transitions
  /// - Game-like interfaces
  /// - Attention-grabbing presentations
  ///
  /// Time complexity: O(1), Space complexity: O(1)
  static PageRoute<T> _buildRotationRoute<T extends Object?>(
    Widget child, {
    RouteSettings? settings,
    double rotationAngle = 0.1,
  }) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionDuration: const Duration(milliseconds: 400),
      reverseTransitionDuration: const Duration(milliseconds: 350),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final rotateAnimation = Tween<double>(begin: rotationAngle, end: 0)
            .animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
            );

        final scaleAnimation = Tween<double>(begin: 0.8, end: 1).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
        );

        return Transform.rotate(
          angle: rotateAnimation.value,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: FadeTransition(opacity: animation, child: child),
          ),
        );
      },
    );
  }

  /// Platform-aware route builder - automatically chooses the best
  /// route type for the platform
  ///
  /// Time complexity: O(1), Space complexity: O(1)
  static PageRoute<T> _buildPlatformAwareRoute<T extends Object?>(
    Widget child, {
    RouteSettings? settings,
    RouteType? forceRouteType,
  }) {
    final routeType = forceRouteType ?? _getDefaultRouteTypeForPlatform();
    return switch (routeType) {
      RouteType.slide => _buildSlideRoute(child, settings: settings),
      RouteType.fade => _buildFadeRoute(child, settings: settings),
      RouteType.cupertinoSheet => _buildCupertinoSheetRoute(
        child,
        settings: settings,
      ),
      RouteType.scale => _buildScaleRoute(child, settings: settings),
      RouteType.rotation => _buildRotationRoute(child, settings: settings),
    };
  }

  /// Determines the default route type based on platform
  ///
  /// Time complexity: O(1), Space complexity: O(1)
  static RouteType _getDefaultRouteTypeForPlatform() {
    if (Platform.isIOS) {
      return RouteType.cupertinoSheet;
    } else if (Platform.isAndroid) {
      return RouteType.slide;
    } else {
      return RouteType.fade; // Default for other platforms
    }
  }
}

/// Usage Examples:
/// 
/// 1. Basic usage in generateRoute:
/// ```dart
/// case AppRoutesName.profileScreen:
///   return _buildCupertinoSheetRoute(
///     const ProfileView(),
///     settings: settings,
///   );
/// ```
/// 
/// 2. Using in widgets directly:
/// ```dart
/// context.pushCupertinoSheet(const SettingsView());
/// ```
/// 
/// 3. Platform-aware routing:
/// ```dart
/// return _buildPlatformAwareRoute(
///   const MyScreen(),
///   settings: settings,
/// );
/// ``
