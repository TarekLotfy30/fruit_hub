abstract final class AppBorderWidth {
  /// Default border width for most components
  static const double defaultBorderWidth = 1;

  /// Border width for focused elements
  /// Thicker border to indicate focus state
  static const double focusedBorderWidth = 1.5;

  /// Border width for enabled input fields in dark theme
  /// Slightly thinner for better dark theme aesthetics
  static const double enabledBorderWidth = 0.85;

  /// Border width for disabled elements
  static const double disabledBorderWidth = 0.5;

  /// Border width for error states
  /// Thicker border to draw attention to errors
  static const double errorBorderWidth = 2;
}
