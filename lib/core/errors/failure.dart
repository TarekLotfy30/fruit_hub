// ignore_for_file: sort_constructors_first

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'api_error_messages.dart';
import 'firebase_error_messages.dart';

// Exception is an abstract class that represents errors that can be caught
// and handled during program execution. It's part of Dart's error handling system
// This is what Exception looks like (simplified)
/*
 abstract class Exception {
 It's mostly empty - just a marker interface
 }
*/

class Failure implements Exception {
  final String errorMessage;
  const Failure({required this.errorMessage});

  factory Failure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return const Failure(errorMessage: ApiErrorMessages.connectionTimeout);
      case DioExceptionType.sendTimeout:
        return const Failure(errorMessage: ApiErrorMessages.sendTimeout);
      case DioExceptionType.receiveTimeout:
        return const Failure(errorMessage: ApiErrorMessages.receiveTimeout);
      case DioExceptionType.badCertificate:
        return const Failure(errorMessage: ApiErrorMessages.badCertificate);
      case DioExceptionType.badResponse:
        if (dioError.response != null) {
          return Failure.fromBadResponse(
            statusCode: dioError.response!.statusCode ?? 0,
            response: dioError.response!.data,
          );
        }
        return const Failure(errorMessage: ApiErrorMessages.nullResponse);
      case DioExceptionType.cancel:
        return const Failure(errorMessage: ApiErrorMessages.requestCancelled);
      case DioExceptionType.connectionError:
        return const Failure(errorMessage: ApiErrorMessages.connectionError);
      case DioExceptionType.unknown:
        if (dioError.message?.contains('SocketException') ?? false) {
          return const Failure(errorMessage: ApiErrorMessages.noInternet);
        }
        return const Failure(errorMessage: ApiErrorMessages.unexpectedError);
    }
  }

  factory Failure.fromBadResponse({
    required int statusCode,
    required dynamic response,
  }) {
    if (response is Map<String, dynamic> &&
        response['message'] is String &&
        response['message'].toString().isNotEmpty) {
      return Failure(errorMessage: response['message']);
    }
    return Failure(
      errorMessage:
          ApiErrorMessages.httpStatusMessages[statusCode] ??
          ApiErrorMessages.unexpectedError,
    );
  }

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
    } else if (error is FirebaseException) {
      if (error.plugin == 'cloud_firestore') {
        return Failure.fromFirestore(error);
      } else if (error.plugin == 'firebase_storage') {
        return Failure.fromFirebaseStorage(error);
      } else {
        return Failure.fromFirestore(error); // Default to Firestore handling
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
