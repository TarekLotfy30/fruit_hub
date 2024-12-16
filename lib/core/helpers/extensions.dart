import 'package:flutter/material.dart';

/// Extension methods for navigation-related operations on [BuildContext].
extension Navigation on BuildContext {
  /// Pushes a new route onto the navigation stack using the [routeName] and
  /// optional [arguments].
  Future<dynamic> navigateToNamedRoute(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  /// Replaces the current route on the stack with a new route using [routeName]
  /// and optional [arguments].
  Future<dynamic> replaceWithNamedRoute(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  /// Pushes a new route and removes routes from the stack until a predicate
  /// (a function that checks a condition on a Route) returns true.
  Future<dynamic> removeAllAndNavigateToNamedRoute(
    String routeName, {
    Object? arguments,
    required bool Function(Route<dynamic>) predicate,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      predicate,
      arguments: arguments,
    );
  }

  /// Navigates back to the previous route in the stack.
  void goBack() {
    Navigator.of(this).pop();
  }
}

// context.pop(),,
