import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/errors/failure.dart';

import '../../../../core/services/firebase/firebase_auth_service.dart';
import '../../../../core/services/firebase/firestore_service.dart';
import '../../../../core/services/local/app_shared_keys.dart';
import '../../../../core/services/local/local_helper.dart';
import '../model/user_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  const AuthRepoImpl({
    required FirestoreService firestoreService,
    required FirebaseAuthService authService,
    required LocalHelper localHelper,
  }) : _authService = authService,
       _firestoreService = firestoreService,
       _localHelper = localHelper;

  final FirebaseAuthService _authService;
  final FirestoreService _firestoreService;
  final LocalHelper _localHelper;

  // ignore: avoid_field_initializers_in_const_classes
  final String _tag = '🔑 [AuthRepoImpl]';

  @override
  Future<Either<Failure, UserModel>> signIn(UserModel user) async {
    try {
      log('📡 Sending request to Firebase...', name: _tag);
      final value = await _authService.signIn(user: user);
      log('✅ Firebase returned user: ${value.user?.uid}', name: _tag);

      final userModel = UserModel.fromFirebase(value.user!);
      log('🎉 UserModel created: $userModel', name: _tag);

      log('📡 Sending user Data to local storage...', name: _tag);
      await _cacheUserData(userModel);
      log('✅ User data cached locally', name: _tag);

      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      log('❌ FirebaseAuthException: ${e.code} - ${e.message}', name: _tag);
      return Left(Failure.fromFirebase(e));
    } on FirebaseException catch (e) {
      log('⚠️ Unexpected error: $e', name: _tag);
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signInWithGoogle() async {
    try {
      final credential = await _authService.signInWithGoogle();
      log(
        '''✅ Firebase returned user: ${credential.user?.displayName} ${credential.user?.email} ${credential.user?.uid}''',
        name: _tag,
      );
      final userModel = UserModel.fromFirebase(credential.user!);
      log('🎉 UserModel created: $userModel', name: _tag);

      if (credential.additionalUserInfo!.isNewUser) {
        log('📡 Sending user to Firestore...', name: _tag);
        await _firestoreService.addData(userModel);
        log('✅ User added to Firestore', name: _tag);
      }

      log('📡 Sending user Data to local storage...', name: _tag);
      await _cacheUserData(userModel);
      log('✅ User data cached locally', name: _tag);

      return Right(userModel);
    } on GoogleSignInException catch (e) {
      log('❌ GoogleSignInException: ${e.code} - ${e.description}', name: _tag);
      return Left(Failure.fromFirebase(e));
    } on FirebaseException catch (e) {
      log('❌ FirebaseException: ${e.code} - ${e.message}', name: _tag);
      return Left(Failure.fromFirebase(e));
    } on Exception catch (e) {
      log('⚠️ Unexpected error: $e', name: _tag);
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUp(UserModel user) async {
    try {
      log('📡 Sending request to Firebase...', name: _tag);
      final credential = await _authService.signUp(user: user);

      await credential.user?.updateProfile(displayName: user.fullname);
      final currentUser = FirebaseAuth.instance.currentUser;

      log(
        '''✅ Firebase returned user: ${currentUser?.displayName} ${currentUser?.email} ${currentUser?.uid}''',
        name: _tag,
      );

      final userModel = UserModel.fromFirebase(currentUser!);
      log('🎉 UserModel created: $userModel', name: _tag);

      log('📡 Sending user to Firestore...', name: _tag);
      log('AUTH UID => ${FirebaseAuth.instance.currentUser?.uid}');
      log('MODEL UID => ${userModel.uid}');
      await _firestoreService.addData(userModel);
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
      await _authService.signOut();
      await _clearSharedPrefs();
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

  Future<void> _cacheUserData(UserModel user) async {
    await Future.wait([
      _localHelper.setValue(key: AppSharedKey.isLoggedIn, value: true),
      _localHelper.setValue(key: AppSharedKey.userId, value: user.uid),
      _localHelper.setValue(key: AppSharedKey.userEmail, value: user.email),
      _localHelper.setValue(
        key: AppSharedKey.userName,
        value: user.fullname.split(' ').first,
      ),
    ]);
  }

  Future<void> _clearSharedPrefs() async {
    await Future.wait([
      _localHelper.removeValue(key: AppSharedKey.isLoggedIn),
      _localHelper.removeValue(key: AppSharedKey.userId),
      _localHelper.removeValue(key: AppSharedKey.userEmail),
      _localHelper.removeValue(key: AppSharedKey.userName),
    ]);
  }
}
