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
}
