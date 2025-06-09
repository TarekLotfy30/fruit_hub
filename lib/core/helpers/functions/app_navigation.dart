import 'dart:developer';

import 'package:flutter/material.dart';

/// A utility class that provides static methods for handling navigation tasks.
/// This class follows the singleton pattern with a private
/// constructor to prevent instantiation.
/// All methods are static and provide various navigation capabilities
///  including:
/// - Pushing new screens
/// - Replacing screens
/// - Removing all previous screens
/// - Popping screens

class Navigation {
  // Private constructor to prevent instantiation
  Navigation._();

  /// Logging tag for navigation events
  static const String _logTag = 'NAVIGATION';

  /// Pushes a new [screen] onto the navigation stack.
  ///
  /// This method adds the provided [screen] widget to the navigation stack,
  /// causing it to appear with a default transition animation
  /// (slide from right).
  ///
  /// Parameters:
  ///   - [context]: The BuildContext used to access the Navigator
  ///   - [screen]: The widget to push onto the stack
  ///
  /// Returns:
  ///   A Future that completes when the pushed route is popped

  static Future<void> push(BuildContext context, Widget screen) async {
    log('Pushing new screen: ${screen.runtimeType}', name: _logTag);

    try {
      await Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => screen));
      log('Screen pushed successfully: ${screen.runtimeType}', name: _logTag);
    } catch (e, stackTrace) {
      log(
        'Error pushing screen: $e',
        name: _logTag,
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Pushes a new [screen] and removes all previous routes from the stack.
  ///
  /// This is typically used for login screens or onboarding flows where you
  /// want to prevent the user from navigating back.
  ///
  /// Parameters:
  ///   - [context]: The BuildContext used to access the Navigator
  ///   - [screen]: The widget that will be the only screen in the stack

  static Future<void> pushAndRemove(BuildContext context, Widget screen) async {
    log(
      'Pushing new screen and removing all previous: ${screen.runtimeType}',
      name: _logTag,
    );

    try {
      await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => screen),
        (route) => false,
      );
      log(
        'page pushed and removed previous successfully: ${screen.runtimeType}',
        name: _logTag,
      );
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

  /// Replaces the current route with a new [screen].
  ///
  /// The current route is popped and the new route is pushed in a single step.
  /// Useful when you want to maintain the back stack but replace the current view.
  ///
  /// Parameters:
  ///   - [context]: The BuildContext used to access the Navigator
  ///   - [screen]: The widget that will replace the current screen
  ///
  /// Throws:
  ///   - FlutterError if context is null or invalid
  ///   - AssertionError if screen is null
  static Future<void> pushReplacement(
    BuildContext context,
    Widget screen,
  ) async {
    log('Replacing current screen with: ${screen.runtimeType}', name: _logTag);

    try {
      await Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => screen));
      log('Screen replaced successfully: ${screen.runtimeType}', name: _logTag);
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
  /// If there are no routes to pop, this will do nothing (unlike Navigator.pop
  /// which throws an exception).
  ///
  /// Parameters:
  ///   - [context]: The BuildContext used to access the Navigator
  ///   - [result]: Optional result to return to the previous route
  static void pop(BuildContext context, [dynamic result]) {
    if (Navigator.of(context).canPop()) {
      log('Popping current screen', name: _logTag);
      Navigator.of(context).pop(result);
    } else {
      log('Cannot pop - no screens in stack', name: _logTag);
    }
  }

  // el function dy khasa be package beta3t el bottom nav bar ..
  // lw enta 3ayz tenavigate w msh 3ayz rl nav bar teb2a zahra ma3ak

  // static void navigateToWithoutNavBar(BuildContext context, Widget screen) {
  //   pushNewScreen(
  //     context,
  //     screen: screen,
  //     // replace this with the screen you want to navigate to
  //     withNavBar: false,
  //     // OPTIONAL VALUE. True by default.
  //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
  //   );
  // }

  /// Navigates to the specified [screen] with custom transition animation.
  // static void pushWithCustomTransition(
  //   BuildContext context,
  //   Widget screen, {
  //   required Duration duration,
  //   required PageTransitionAnimation transitionAnimation,
  // }) {
  //   Navigator.push(
  //     context,
  //     PageRouteBuilder(
  //       pageBuilder: (_, __, ___) => screen,
  //       transitionDuration: duration,
  //       transitionsBuilder: (_, a, __, c) {
  //         return transitionAnimation.transition(context, a, c);
  //       },
  //     ),
  //   );
  // }
}
