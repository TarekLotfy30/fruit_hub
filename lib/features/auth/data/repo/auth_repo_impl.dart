import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/firebase/firebase_service.dart';
import '../model/user_model.dart';
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

      final UserModel userModel = UserModel.fromFirebase(value.user!);
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
      final credential = await firebaseService.signUp(
        email: email,
        password: password,
      );
      await credential.user?.updateProfile(displayName: fullname);
      final currentUser = FirebaseAuth.instance.currentUser;

      log(
        '''✅ Firebase returned user: ${currentUser?.displayName} ${currentUser?.email} ${currentUser?.uid}''',
        name: _tag,
      );

      final UserModel userModel = UserModel.fromFirebase(currentUser!);
      log('🎉 UserModel created: $userModel', name: _tag);

      log('📡 Sending user to Firestore...', name: _tag);
      await firebaseService.addUserToFirestore(userModel);
      log('✅ User added to Firestore', name: _tag);

      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      log('❌ FirebaseAuthException: ${e.code} - ${e.message}', name: _tag);
      return Left(Failure.fromFirebase(e));
    } on FirebaseException catch (e) {
      log('❌ FirebaseException: ${e.code} - ${e.message}', name: _tag);
      return Left(Failure.fromFirebase(e));
    } catch (e) {
      log('⚠️ Unexpected error: $e', name: _tag);
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      log('📡 Sending sign-out request to Firebase...', name: _tag);
      await firebaseService.signOut();
      log('✅ Firebase sign-out completed', name: _tag);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      log(
        '❌ FirebaseAuthException during sign-out: ${e.code} - ${e.message}',
        name: _tag,
      );
      return Left(Failure.fromFirebase(e));
    } catch (e) {
      log('⚠️ Unexpected error during sign-out: $e', name: _tag);
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
