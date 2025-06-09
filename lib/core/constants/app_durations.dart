/// Duration constants for consistent timing throughout the app
///
class AppDurations {
  /// Private constructor to prevent instantiation
  const AppDurations._();

  /// Standard animation duration (300ms)
  static const Duration standard = Duration(milliseconds: 300);
  static const Duration short = Duration(milliseconds: 200);

  /// Quick animation duration (150ms)
  static const Duration quick = Duration(milliseconds: 150);

  /// Extended animation duration (500ms)
  static const Duration extended = Duration(milliseconds: 500);

  /// Short snackbar duration (1 second)
  static const Duration snackbarShort = Duration(seconds: 1);

  /// Standard snackbar duration (3 seconds)
  static const Duration snackbarStandard = Duration(seconds: 3);
}
