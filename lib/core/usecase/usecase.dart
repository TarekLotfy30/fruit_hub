import 'package:dartz/dartz.dart';

import '../errors/failure.dart';


/// [ReturnType] is the success return type.
/// [Params] is the input data class.
abstract class UseCase<ReturnType, Params> {
  Future<Either<Failure, ReturnType>> call([Params params]);
}

/// Use this class if your UseCase doesn't require any parameters.
class NoParams {}


//EXAMPLE
/* class GetUserParams {
  final String userId;
  GetUserParams({required this.userId});
}

class GetUserProfile implements UseCase<UserEntity, GetUserParams> {
  final UserRepository repository;

  GetUserProfile(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(GetUserParams params) async {
    return await repository.getUser(params.userId);
  }
} 

class Logout implements UseCase<void, NoParams> {
  final AuthRepository repository;

  Logout(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    // We pass the call down to the repository
    return await repository.logout();
  }
}

*/

//!OR

// 3ayz agber ay had en hwa yenade 3ala el method ely esmaha call

// no paramter usecase

/* 
abstract class UseCase<Type> {
  Future <Either <Failure,Type>> call();
}

abstract class UseCase<Type,Param> {
  Future <Either <Failure,Type>> call(Param param);
} */

// lama tegy tenady 3ala haga 3ala hasab hwa nafs el esm ah bas fe ekhtlad fe el arguments ely dakhla

