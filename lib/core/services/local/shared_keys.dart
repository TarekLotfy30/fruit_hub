/// Enum representing keys used in the app's shared preferences.
/// Using an enum ensures type safety and prevents typos in key names.
enum AppSharedKey {
  /// Key for storing the app theme (dark mode or light mode).
  isDarkMode,

  /// Key for storing the onboarding status (skipped or not).
  skipOnBoarding,
}

// Usage:
// String key = AppSharedKeys.isDarkMode.toString();
