/// Duration constants for consistent timing throughout the app
///
abstract final class AppDurations {
  /// Standard animation duration for UI transitions
  static const Duration standardAnimationDuration = Duration(milliseconds: 300);

  /// Fast animation duration for quick feedback
  static const Duration fastAnimationDuration = Duration(milliseconds: 150);

  /// Slow animation duration for complex transitions
  static const Duration slowAnimationDuration = Duration(milliseconds: 3000);

  /// Short snackbar duration (1 second)
  static const Duration snackbarShort = Duration(seconds: 1);

  /// Standard snackbar duration (3 seconds)
  static const Duration snackbarStandard = Duration(seconds: 3);

  // SPLASH SCREEN SPECIFIC DURATIONS
  static const animStep = Duration(milliseconds: 300);
  static const initDelay = Duration(milliseconds: 100);
  static const stepDelay = Duration(milliseconds: 400);
  static const holdDelay = Duration(seconds: 2);
 
  /// Total controller duration = initDelay + stepDelay + stepDelay + holdDelay
  static const totalDuration = Duration(milliseconds: 3200);
}
