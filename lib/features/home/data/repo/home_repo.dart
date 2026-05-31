import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract interface class HomeRepo {
  Either<Failure, String> getUserName();
}
