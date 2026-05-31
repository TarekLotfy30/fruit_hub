import '../../../../core/routing/app_routes_name.dart';
import '../repo/splash_repo.dart';

class SplashUseCase {
  final SplashRepo _repo;

  SplashUseCase(this._repo);

  // ✅ Use Case's job — combine them into a routing DECISION
  // Business decision

  String call() {
    if (_repo.isLoggedIn) {
      return AppRoutesName.homeScreen;
    } else if (_repo.skipOnboarding) {
      return AppRoutesName.signInScreen;
    } else {
      return AppRoutesName.onboardingScreen;
    }
  }
}
