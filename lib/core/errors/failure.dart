// ignore_for_file: sort_constructors_first

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'firebase_error_messages.dart';

// Exception is an abstract class that represents errors that can be caught
// and handled during program execution. It's part of Dart's error handling
// system This is what Exception looks like (simplified)
/*
 abstract class Exception {
 It's mostly empty - just a marker interface
 }
*/

class Failure implements Exception {
  final String errorMessage;
  const Failure({required this.errorMessage});

  factory Failure.fromException(Exception exception) {
    return Failure(errorMessage: exception.toString());
  }

  // Create Failure from FirebaseAuthException
  factory Failure.fromFirebaseAuth(FirebaseAuthException authError) {
    final message =
        FirebaseErrorMessages.firebaseAuthMessages[authError.code] ??
        authError.message ??
        FirebaseErrorMessages.firebaseGenericError;
    return Failure(errorMessage: message);
  }

  // Create Failure from GoogleSignInException
  factory Failure.fromGoogleAuth(GoogleSignInException googleError) {
    // Convert GoogleSignInExceptionCode enum to string key
    final String errorKey;
    switch (googleError.code) {
      case GoogleSignInExceptionCode.canceled:
        errorKey = 'sign_in_canceled';
      case GoogleSignInExceptionCode.clientConfigurationError:
        errorKey = 'developer_error';
      case GoogleSignInExceptionCode.interrupted:
        errorKey = 'interrupted';
      case GoogleSignInExceptionCode.providerConfigurationError:
      case GoogleSignInExceptionCode.uiUnavailable:
        errorKey = 'developer_error';
      case GoogleSignInExceptionCode.unknownError:
        errorKey = 'unknown_error';
      case GoogleSignInExceptionCode.userMismatch:
        errorKey = 'user_mismatch';  
    }
    log('❌ Mapped error key: $errorKey');
    final message =
        FirebaseErrorMessages.googleAuthMessages[errorKey] ??
        googleError.description ??
        FirebaseErrorMessages.firebaseGenericError;

    return Failure(errorMessage: message);
  }

  // Handle Firestore exceptions
  factory Failure.fromFirestore(FirebaseException firestoreError) {
    final message =
        FirebaseErrorMessages.firestoreMessages[firestoreError.code] ??
        firestoreError.message ??
        FirebaseErrorMessages.firebaseGenericError;
    return Failure(errorMessage: message);
  }

  // Handle Firebase Storage exceptions
  factory Failure.fromFirebaseStorage(FirebaseException storageError) {
    final message =
        FirebaseErrorMessages.firebaseStorageMessages[storageError.code] ??
        storageError.message ??
        FirebaseErrorMessages.firebaseGenericError;

    return Failure(errorMessage: message);
  }

  // Handle Cloud Functions exceptions
  // factory Failure.fromCloudFunctions(FirebaseFunctionsException functionsError) {
  //   final message = FirebaseErrorMessages.cloudFunctionsMessages[functionsError.code] ??
  //                  functionsError.message ??
  //                  FirebaseErrorMessages.firebaseGenericError;
  //   return Failure(
  //     errorMessage: message,
  //   );
  // }
  factory Failure.fromFirebase(Exception error) {
    if (error is FirebaseAuthException) {
      return Failure.fromFirebaseAuth(error);
    } else if (error is GoogleSignInException) {
      return Failure.fromGoogleAuth(error);
      // } else if (error is FirebaseFunctionsException) {
      //   return Failure.fromCloudFunctions(error);
    } else if (error is FirebaseException) {
      switch (error.plugin) {
        case 'cloud_firestore':
          return Failure.fromFirestore(error);
        case 'firebase_storage':
          return Failure.fromFirebaseStorage(error);
        case 'cloud_functions':
          // Handle as generic FirebaseException if FirebaseFunctionsException not caught
          final message =
              FirebaseErrorMessages.cloudFunctionsMessages[error.code] ??
              error.message ??
              FirebaseErrorMessages.firebaseGenericError;
          return Failure(errorMessage: message);
        default:
          return Failure.fromFirestore(error);
      }
    } else {
      return Failure(errorMessage: error.toString());
    }
  }

  @override
  String toString() => 'Failure: $errorMessage';
}
