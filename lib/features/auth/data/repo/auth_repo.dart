import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../model/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> signUp(
    String email,
    String password,
    String fullName,
  );

  Future<Either<Failure, UserModel>> signIn(String email, String password);

  Future<Either<Failure, UserModel>> signInWithGoogle();

  Future<Either<Failure, void>> signOut();
}
