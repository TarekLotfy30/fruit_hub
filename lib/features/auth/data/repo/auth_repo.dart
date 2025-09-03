import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../model/user.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> signUp(
    String email,
    String password,
    String fullname,
  );
  //Future<Either<Failure, void>> sendEmailVerification();
  //Future<Either<Failure, bool>> isEmailVerified();
  Future<Either<Failure, UserModel>> signIn(String email, String password);
  Future<Either<Failure, void>> signOut();
}
