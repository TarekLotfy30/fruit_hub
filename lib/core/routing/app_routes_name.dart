/// Centralized route names for the application.
///
/// This class provides a single source of truth for all route paths in the app,
/// preventing typos and making route management easier.
/// All routes should be defined as static constants here.
abstract final class AppRoutesName {
  // Splash route
  static const String splashScreen = '/';
  // onboarding route
  static const String onboardingScreen = '/onboarding';

  // Authentication routes
  static const String signInScreen = '/sign_in';
  static const String signUpScreen = '/sign_up';
  static const String forgetPasswordScreen = '/forget_password';

  // Home/
  static const String homeScreen = '/home';

  // Nested Routes (if using nested navigation)
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

  // Dynamic Routes (templates)
  //static const String productDetailTemplate = '/product-detail/:productId';
  //static const String userProfileTemplate = '/user/:userId/profile';
}
