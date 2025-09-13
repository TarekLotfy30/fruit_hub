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
      default:
        errorKey = 'sign_in_failed';
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

  factory Failure.fromFirebase(dynamic error) {
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





// "This Failure class represents an error condition"
// "It can be thrown and caught like other exceptions"
// "It follows the Exception contract"
// throw Failure(errorMessage: "Something went wrong");


// usage :

/*Future<Either<Failure, User>> getUser() async {
  try {
    // API call
    return Right(user);
  } on DioException catch (e) {
    return Left(Failure.fromDioError(e)); // Clear error type
  }
}*/


// void fetchUserData() async {
//   try {
//     final result = await userRepository.getUser();
//     result.fold(
//       (failure) => showError(failure.errorMessage), // Handle Failure
//       (user) => displayUser(user),                  // Handle success
//     );
//   } catch (e) {
//     // This catches any other unexpected errors
//     print("Unexpected error: $e");
//   }
// }



// In your Repository
// try {
//   final result = await _firestore.collection('users').get();
//   return Right(result);
// } on FirebaseException catch (e) {
//   return Left(Failure.fromFirestore(e));
// } on FirebaseAuthException catch (e) {
//   return Left(Failure.fromFirebaseAuth(e));
// } catch (e) {
//   return Left(Failure.fromFirebase(e)); // Handles any other Firebase error
// }



















  // Enhanced fromFirebase factory with better error handling
  // factory Failure.fromFirebase(dynamic error) {
  //   try {
  //     if (error is FirebaseAuthException) {
  //       return Failure.fromFirebaseAuth(error);
  //     } else if (error is GoogleSignInException) {
  //       return Failure.fromGoogleAuth(error);
  //     } else if (error is PlatformException) {
  //       // Handle Google Sign-In PlatformExceptions
  //       if (error.code.contains('google') || 
  //           error.code == 'sign_in_canceled' || 
  //           error.code == 'sign_in_failed') {
  //         return Failure.fromGoogleSignInPlatformException(error);
  //       }
  //       // Handle other PlatformExceptions
  //       return Failure(errorMessage: error.message ?? error.toString());
  //     } else if (error is FirebaseFunctionsException) {
  //       return Failure.fromCloudFunctions(error);
  //     } else if (error is FirebaseException) {
  //       switch (error.plugin) {
  //         case 'cloud_firestore':
  //           return Failure.fromFirestore(error);
  //         case 'firebase_storage':
  //           return Failure.fromFirebaseStorage(error);
  //         case 'cloud_functions':
  //           // Handle as generic FirebaseException if FirebaseFunctionsException wasn't caught
  //           final message = FirebaseErrorMessages.cloudFunctionsMessages[error.code] ??
  //                          error.message ??
  //                          FirebaseErrorMessages.firebaseGenericError;
  //           return Failure(errorMessage: message);
  //         default:
  //           return Failure.fromFirestore(error); // Default fallback
  //       }
  //     } else {
  //       return Failure(errorMessage: error.toString());
  //     }
  //   } catch (e) {
  //     // Fallback in case of any unexpected errors during error handling
  //     return Failure(errorMessage: FirebaseErrorMessages.firebaseGenericError);
  //   }
  // }