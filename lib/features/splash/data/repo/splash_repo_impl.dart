import '../../../../core/services/local/app_shared_keys.dart';
import '../../../../core/services/local/local_helper.dart';
import 'splash_repo.dart';

class SplashRepoImpl implements SplashRepo {
  const SplashRepoImpl(this._localHelper);
  final LocalHelper _localHelper;

  // ✅ Repository's job — fetch the raw stored values
  // Because the Repository should have zero knowledge of routing or navigation
  @override
  bool get isLoggedIn =>
      _localHelper.getValue(key: AppSharedKey.isLoggedIn) as bool? ?? false;
  @override
  bool get skipOnboarding =>
      _localHelper.getValue(key: AppSharedKey.skipOnBoarding) as bool? ?? false;
}
