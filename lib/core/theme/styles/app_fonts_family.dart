/// A utility class to manage font families used in the app.
/// This class is designed as a singleton with a private constructor
/// to prevent instantiation,
/// ensuring that font names are accessed statically in a consistent manner.
class AppFontFamily {
  // Private constructor to prevent instantiation of the class.
  const AppFontFamily._();

  // Font family constants, defined as immutable
  // strings for clarity and type safety.

  static const String cairo = 'Cairo';

}
