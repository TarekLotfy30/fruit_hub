import 'dart:developer';

import 'package:flutter/material.dart';

import '../extensions/navigator_extension.dart';

/// A utility class that provides static methods for handling navigation
///  tasks using named routes.
abstract final class AppNavigation {
  // Private constructor to prevent instantiation
  AppNavigation._();

  /// Logging tag for navigation events
  static const String _logTag = 'NAVIGATION';

  /// Pushes a new screen identified by [routeName] onto the navigation stack.
  ///
  /// Parameters:
  ///   - [context]: The BuildContext used to access the Navigator
  ///   - [routeName]: The name of the route to push
  ///   - [arguments]: Optional arguments passed to the route
  ///
  /// Returns:
  ///   A Future that completes when the pushed route is popped
  static Future<void> navigateTo(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) async {
    log('Pushing route: $routeName', name: _logTag);

    try {
      await context.navigator.pushNamed(routeName, arguments: arguments);
      log('Route pushed successfully: $routeName', name: _logTag);
    } catch (e, stackTrace) {
      log(
        'Error pushing route: $e',
        name: _logTag,
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Pushes a new screen identified by [routeName] and removes
  /// all previous routes.
  ///
  /// Useful for login or onboarding screens where back navigation should
  ///  be disabled.
  ///
  /// Parameters:
  ///   - [context]: The BuildContext used to access the Navigator
  ///   - [routeName]: The name of the route to navigate to
  ///   - [arguments]: Optional arguments passed to the route
  static Future<void> navigateToAndClearStack(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) async {
    log('Pushing $routeName and removing previous routes', name: _logTag);

    try {
      await context.navigator.pushNamedAndRemoveUntil(
        routeName,
        (route) => false,
        arguments: arguments,
      );
      log('Route pushed and previous removed: $routeName', name: _logTag);
    } catch (e, stackTrace) {
      log(
        'Error in pushAndRemove: $e',
        name: _logTag,
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Replaces the current route with a new one identified by [routeName].
  ///
  /// Parameters:
  ///   - [context]: The BuildContext used to access the Navigator
  ///   - [routeName]: The name of the route to replace with
  ///   - [arguments]: Optional arguments passed to the route
  static Future<void> navigateToAndReplace(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) async {
    log('Replacing current route with: $routeName', name: _logTag);

    try {
      await context.navigator.pushReplacementNamed(
        routeName,
        arguments: arguments,
      );
      log('Route replaced successfully: $routeName', name: _logTag);
    } catch (e, stackTrace) {
      log(
        'Error in pushReplacement: $e',
        name: _logTag,
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Pops the current route from the navigation stack.
  ///
  /// If there are no routes to pop, this will do nothing.
  ///
  /// Parameters:
  ///   - [context]: The BuildContext used to access the Navigator
  ///   - [result]: Optional result to return to the previous route
  static void goBack(BuildContext context, [dynamic result]) {
    if (context.navigator.canPop()) {
      log('Popping current route', name: _logTag);
      context.navigator.pop(result);
    } else {
      log('Cannot pop - no routes in stack', name: _logTag);
    }
  }
}
