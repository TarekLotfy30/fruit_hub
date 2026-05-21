import '../../../../core/routing/app_routes_name.dart';
import '../../../../core/services/local/app_shared_keys.dart';
import '../../../../core/services/local/local_helper.dart';
import 'get_initial_repo.dart';

class GetInitialRouteRepoImpl implements GetInitialRouteRepo {
  const GetInitialRouteRepoImpl(this._localHelper);
  final LocalHelper _localHelper;

  /// Determines the initial route based on onboarding and login state.
  ///
  /// Returns:
  ///   - [AppRoutesName.onboardingScreen] for first-time users
  ///   - [AppRoutesName.homeScreen] for authenticated returning users
  ///   - [AppRoutesName.signInScreen] for returning unauthenticated users

  @override
  String call() {
    final skipOnboarding =
        _localHelper.getValue(key: AppSharedKey.skipOnBoarding) as bool? ??
        false;

    if (!skipOnboarding) {
      return AppRoutesName.onboardingScreen;
    }

    final rawLoggedIn = _localHelper.getValue(key: AppSharedKey.isLoggedIn);
    final isLoggedIn = rawLoggedIn is bool && rawLoggedIn;

    return isLoggedIn ? AppRoutesName.homeScreen : AppRoutesName.signInScreen;
  }
}
