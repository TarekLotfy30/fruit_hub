import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/firebase/firebase_service.dart';
import '../../../../core/services/local/app_shared_keys.dart';
import '../../../../core/services/local/local_helper.dart';
import '../model/user.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  const AuthRepoImpl({
    required this.firebaseService,
    required this.localHelper,
  });
  final FirebaseService firebaseService;
  final LocalHelper localHelper;

  // ignore: avoid_field_initializers_in_const_classes
  final String _tag = '🔑 [AuthRepoImpl]';

  @override
  Future<Either<Failure, UserModel>> signIn(String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> signOut() {
    throw UnimplementedError();
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

      log('💾 Saving user to local storage...', name: _tag);
      await saveUserToLocal(userModel);
      log('✅ User saved to local storage', name: _tag);

      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      log('❌ FirebaseAuthException: ${e.code} - ${e.message}', name: _tag);
      return left(Failure.fromFirebase(e));
    } catch (e) {
      log('⚠️ Unexpected error: $e', name: _tag);
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  Future<void> saveUserToLocal(UserModel userModel) async {
    await localHelper.setValue(key: AppSharedKey.isLoggedIn, value: true);
    await localHelper.setValue(
      key: AppSharedKey.userName,
      value: userModel.fullname.trim().split(' ').first,
    );
    await localHelper.setValue(key: AppSharedKey.userId, value: userModel.id);
    await localHelper.setValue(
      key: AppSharedKey.userEmail,
      value: userModel.email,
    );
  }
}
