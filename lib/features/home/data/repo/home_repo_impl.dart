import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/local/app_shared_keys.dart';
import '../../../../core/services/local/local_helper.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  const HomeRepoImpl(this._localHelper);

  final LocalHelper _localHelper;

  @override
  Either<Failure, String> getUserName() {
    try {
      final raw = _localHelper.getValue(key: AppSharedKey.userName);
      if (raw == null) {
        return const Left(Failure(errorMessage: 'User name not found.'));
      }
      final userName = raw as String;
      if (userName.trim().isEmpty) {
        return const Left(Failure(errorMessage: 'User name is empty.'));
      }
      return Right(userName);
    } on Exception catch (_) {
      // developer.log('Failed to read userName', error: e, name: 'HomeRepo');
      return const Left(Failure(errorMessage: 'Failed to load user data. '));
    }
  }
}
