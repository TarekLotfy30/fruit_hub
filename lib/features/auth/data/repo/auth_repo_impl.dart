import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/firebase/firebase_service.dart';
import '../model/user.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  const AuthRepoImpl({required this.firebaseService});
  final FirebaseService firebaseService;

  // ignore: avoid_field_initializers_in_const_classes
  final String _tag = '🔑 [AuthRepoImpl]';

  @override
  Future<Either<Failure, UserModel>> signIn(
    String email,
    String password,
  ) async {
    try {
      log('📡 Sending request to Firebase...', name: _tag);
      final value = await firebaseService.signIn(
        email: email,
        password: password,
      );
      log('✅ Firebase returned user: ${value.user?.uid}', name: _tag);

      final UserModel userModel = UserModel.fromFirebaseUser(value.user!);
      log('🎉 UserModel created: $userModel', name: _tag);
      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      log('❌ FirebaseAuthException: ${e.code} - ${e.message}', name: _tag);
      return Left(Failure.fromFirebase(e));
    } catch (e) {
      log('⚠️ Unexpected error: $e', name: _tag);
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUp(
    String email,
    String password,
    String fullname,
  ) async {
    try {
      log('📡 Sending request to Firebase...', name: _tag);
      final value = await firebaseService.signUp(
        email: email,
        password: password,
        fullname: fullname,
      );
      log('✅ Firebase returned user: ${value.user?.uid}', name: _tag);

      final UserModel userModel = UserModel.fromFirebaseUser(value.user!);
      log('🎉 UserModel created: $userModel', name: _tag);

      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      log('❌ FirebaseAuthException: ${e.code} - ${e.message}', name: _tag);
      return left(Failure.fromFirebase(e));
    } catch (e) {
      log('⚠️ Unexpected error: $e', name: _tag);
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() {
    throw UnimplementedError();
  }
}
