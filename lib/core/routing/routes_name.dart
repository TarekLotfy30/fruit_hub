/// Centralized route names for the application.
///
/// This class provides a single source of truth for all route paths in the app,
/// preventing typos and making route management easier.
/// All routes should be defined as static constants here.
class RoutesName {
  // Private constructor to prevent instantiation
  RoutesName._();

  // Initial route
  static const String splashScreen = '/';

  // onboarding routes
  static const String onboardingScreen = '/onboarding';

  // // Home/root routes
  // static const String homeScreen = '/home';

  // // Authentication routes
  // static const String loginScreen = '/auth/login';
  // static const String signupScreen = '/auth/signup';
  // static const String forgotPasswordScreen = '/auth/forgot_password';
  // static const String resetPasswordScreen = '/auth/reset_password';

  // // Character feature routes
  // static const String characterDetailsScreen = '/characters/details';
  // static const String characterSearchScreen = '/characters/search';

  // // Book feature routes
  // static const String bookListScreen = '/books';
  // static const String bookDetailsScreen = '/books/details';

  // // Profile routes
  // static const String profileScreen = '/profile';
  // static const String editProfileScreen = '/profile/edit';
  // static const String settingsScreen = '/settings';
}
