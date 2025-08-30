abstract class FirebaseErrorMessages {
  // Firebase Auth error messages
  static const Map<String, String> firebaseAuthMessages = {
    'user-not-found': 'No user found with this email address.',
    'wrong-password': 'Wrong password provided for this user.',
    'email-already-in-use':
        'An account already exists with this email address.',
    'weak-password': 'The password is too weak.',
    'invalid-email': 'The email address is not valid.',
    'user-disabled': 'This user account has been disabled.',
    'too-many-requests':
        'Too many unsuccessful attempts. Please try again later.',
    'operation-not-allowed': 'This sign-in method is not allowed.',
    'invalid-credential':
        'The supplied auth credential is malformed or has expired.',
    'account-exists-with-different-credential':
        'An account already exists with the same email but different sign-in credentials.',
    'requires-recent-login':
        'This operation requires recent authentication. Please log in again.',
    'credential-already-in-use':
        'This credential is already associated with a different user account.',
    'invalid-verification-code': 'The verification code is invalid.',
    'invalid-verification-id': 'The verification ID is invalid.',
    'missing-verification-code': 'The verification code is missing.',
    'missing-verification-id': 'The verification ID is missing.',
    'session-expired': 'The SMS code has expired.',
    'quota-exceeded': 'The SMS quota has been exceeded.',
    'missing-phone-number': 'The phone number is missing.',
    'invalid-phone-number': 'The phone number is invalid.',
    'missing-code': 'The verification code is missing.',
    'invalid-code': 'The verification code is invalid.',
    'network-request-failed':
        'A network error occurred. Please check your connection.',
  };

  // Firebase Firestore error messages
  static const Map<String, String> firestoreMessages = {
    'permission-denied': 'You don\'t have permission to access this resource.',
    'not-found': 'The requested document was not found.',
    'already-exists': 'The document already exists.',
    'resource-exhausted': 'Quota exceeded. Please try again later.',
    'failed-precondition': 'The operation failed due to a conflict.',
    'aborted': 'The operation was aborted due to a conflict.',
    'out-of-range': 'The specified range is invalid.',
    'unimplemented': 'This operation is not implemented or supported.',
    'internal': 'An internal error occurred.',
    'unavailable':
        'The service is currently unavailable. Please try again later.',
    'data-loss': 'Unrecoverable data loss or corruption.',
    'unauthenticated':
        'The request does not have valid authentication credentials.',
    'deadline-exceeded': 'The operation timed out.',
    'cancelled': 'The operation was cancelled.',
    'invalid-argument': 'Invalid argument provided.',
  };

  // Firebase Storage error messages
  static const Map<String, String> firebaseStorageMessages = {
    'storage/unknown': 'An unknown error occurred.',
    'storage/object-not-found': 'No object exists at the desired reference.',
    'storage/bucket-not-found': 'No bucket is configured for Cloud Storage.',
    'storage/project-not-found': 'No project is configured for Cloud Storage.',
    'storage/quota-exceeded':
        'Quota on your Cloud Storage bucket has been exceeded.',
    'storage/unauthenticated':
        'User is unauthenticated. Please authenticate and try again.',
    'storage/unauthorized':
        'User is not authorized to perform the desired action.',
    'storage/retry-limit-exceeded':
        'The maximum time limit on an operation has been exceeded.',
    'storage/invalid-checksum':
        'File on the client does not match the checksum of the file received by the server.',
    'storage/canceled': 'User canceled the operation.',
    'storage/invalid-event-name': 'Invalid event name provided.',
    'storage/invalid-url': 'Invalid URL provided.',
    'storage/invalid-argument': 'Invalid argument provided.',
    'storage/no-default-bucket': 'No bucket has been set in your config.',
    'storage/cannot-slice-blob':
        'Commonly occurs when the local file has changed.',
    'storage/server-file-wrong-size':
        'File on the client does not match the size of the file received by the server.',
  };

  // Firebase Cloud Functions error messages
  static const Map<String, String> cloudFunctionsMessages = {
    'functions/ok': 'The operation completed successfully.',
    'functions/cancelled': 'The operation was cancelled.',
    'functions/unknown':
        'Unknown error or an error from a different error domain.',
    'functions/invalid-argument': 'Client specified an invalid argument.',
    'functions/deadline-exceeded':
        'Deadline expired before operation could complete.',
    'functions/not-found': 'Some requested entity was not found.',
    'functions/already-exists':
        'Some entity that we attempted to create already exists.',
    'functions/permission-denied':
        'The caller does not have permission to execute the specified operation.',
    'functions/resource-exhausted': 'Some resource has been exhausted.',
    'functions/failed-precondition':
        'Operation was rejected because the system is not in a state required for the operation.',
    'functions/aborted': 'The operation was aborted.',
    'functions/out-of-range': 'Operation was attempted past the valid range.',
    'functions/unimplemented': 'Operation is not implemented or not supported.',
    'functions/internal': 'Internal errors.',
    'functions/unavailable': 'The service is currently unavailable.',
    'functions/data-loss': 'Unrecoverable data loss or corruption.',
    'functions/unauthenticated':
        'The request does not have valid authentication credentials.',
  };

  // General Firebase error messages
  static const String firebaseGenericError =
      'A Firebase error occurred. Please try again.';
  static const String firebaseNetworkError =
      'Network error. Please check your internet connection.';
  static const String firebaseTimeoutError =
      'The operation timed out. Please try again.';
}
