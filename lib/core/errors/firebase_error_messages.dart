import 'package:easy_localization/easy_localization.dart';

import '../translation/locale_keys.g.dart';

abstract class FirebaseErrorMessages {
  FirebaseErrorMessages._();

  // Firebase Auth error messages
  static final Map<String, String> firebaseAuthMessages = {
    'user-not-found': LocaleKeys.firebase_errors_user_not_found.tr(),
    'wrong-password': LocaleKeys.firebase_errors_wrong_password.tr(),
    'email-already-in-use': LocaleKeys.firebase_errors_email_already_in_use
        .tr(),
    'weak-password': LocaleKeys.firebase_errors_weak_password.tr(),
    'invalid-email': LocaleKeys.firebase_errors_invalid_email.tr(),
    'user-disabled': LocaleKeys.firebase_errors_user_disabled.tr(),
    'too-many-requests': LocaleKeys.firebase_errors_too_many_requests.tr(),
    'operation-not-allowed': LocaleKeys.firebase_errors_operation_not_allowed
        .tr(),
    'invalid-credential': LocaleKeys.firebase_errors_invalid_credential.tr(),
    'account-exists-with-different-credential': LocaleKeys
        .firebase_errors_account_exists_with_different_credential
        .tr(),
    'requires-recent-login': LocaleKeys.firebase_errors_requires_recent_login
        .tr(),
    'credential-already-in-use': LocaleKeys
        .firebase_errors_credential_already_in_use
        .tr(),
    'invalid-verification-code': LocaleKeys
        .firebase_errors_invalid_verification_code
        .tr(),
    'invalid-verification-id': LocaleKeys
        .firebase_errors_invalid_verification_id
        .tr(),
    'missing-verification-code': LocaleKeys
        .firebase_errors_missing_verification_code
        .tr(),
    'missing-verification-id': LocaleKeys
        .firebase_errors_missing_verification_id
        .tr(),
    'session-expired': LocaleKeys.firebase_errors_session_expired.tr(),
    'quota-exceeded': LocaleKeys.firebase_errors_quota_exceeded.tr(),
    'missing-phone-number': LocaleKeys.firebase_errors_missing_phone_number
        .tr(),
    'invalid-phone-number': LocaleKeys.firebase_errors_invalid_phone_number
        .tr(),
    'network-request-failed': LocaleKeys.firebase_errors_network_request_failed
        .tr(),
  };

  // Google Sign-In error messages
  static final Map<String, String> googleAuthMessages = {
    'sign_in_canceled': LocaleKeys.firebase_errors_google_sign_in_canceled.tr(),
    'invalid_account': LocaleKeys.firebase_errors_google_invalid_account.tr(),
    'account_restricted': LocaleKeys.firebase_errors_google_account_restricted
        .tr(),
    'account_disabled': LocaleKeys.firebase_errors_google_account_disabled.tr(),
    'play_services_unavailable': LocaleKeys
        .firebase_errors_google_play_services_unavailable
        .tr(),
    'play_services_update_required': LocaleKeys
        .firebase_errors_google_play_services_update_required
        .tr(),
    'play_services_missing': LocaleKeys
        .firebase_errors_google_play_services_missing
        .tr(),
    'timeout': LocaleKeys.firebase_errors_google_timeout.tr(),
    'developer_error': LocaleKeys.firebase_errors_google_developer_error.tr(),
    'internal_error': LocaleKeys.firebase_errors_google_internal_error.tr(),
    'api_not_available': LocaleKeys.firebase_errors_google_api_not_available
        .tr(),
    'interrupted': LocaleKeys.firebase_errors_google_interrupted.tr(),
  };

  // Firebase Firestore error messages
  static final Map<String, String> firestoreMessages = {
    'permission-denied': LocaleKeys.firebase_errors_firestore_permission_denied
        .tr(),
    'not-found': LocaleKeys.firebase_errors_firestore_not_found.tr(),
    'already-exists': LocaleKeys.firebase_errors_firestore_already_exists.tr(),
    'resource-exhausted': LocaleKeys
        .firebase_errors_firestore_resource_exhausted
        .tr(),
    'failed-precondition': LocaleKeys
        .firebase_errors_firestore_failed_precondition
        .tr(),
    'aborted': LocaleKeys.firebase_errors_firestore_aborted.tr(),
    'out-of-range': LocaleKeys.firebase_errors_firestore_out_of_range.tr(),
    'unimplemented': LocaleKeys.firebase_errors_firestore_unimplemented.tr(),
    'internal': LocaleKeys.firebase_errors_firestore_internal.tr(),
    'unavailable': LocaleKeys.firebase_errors_firestore_unavailable.tr(),
    'data-loss': LocaleKeys.firebase_errors_firestore_data_loss.tr(),
    'unauthenticated': LocaleKeys.firebase_errors_firestore_unauthenticated
        .tr(),
    'deadline-exceeded': LocaleKeys.firebase_errors_firestore_deadline_exceeded
        .tr(),
    'cancelled': LocaleKeys.firebase_errors_firestore_cancelled.tr(),
    'invalid-argument': LocaleKeys.firebase_errors_firestore_invalid_argument
        .tr(),
  };

  // Firebase Storage error messages
  static final Map<String, String> firebaseStorageMessages = {
    'storage/unknown': LocaleKeys.firebase_errors_storage_unknown.tr(),
    'storage/object-not-found': LocaleKeys
        .firebase_errors_storage_object_not_found
        .tr(),
    'storage/bucket-not-found': LocaleKeys
        .firebase_errors_storage_bucket_not_found
        .tr(),
    'storage/project-not-found': LocaleKeys
        .firebase_errors_storage_project_not_found
        .tr(),
    'storage/quota-exceeded': LocaleKeys.firebase_errors_storage_quota_exceeded
        .tr(),
    'storage/unauthenticated': LocaleKeys
        .firebase_errors_storage_unauthenticated
        .tr(),
    'storage/unauthorized': LocaleKeys.firebase_errors_storage_unauthorized
        .tr(),
    'storage/retry-limit-exceeded': LocaleKeys
        .firebase_errors_storage_retry_limit_exceeded
        .tr(),
    'storage/invalid-checksum': LocaleKeys
        .firebase_errors_storage_invalid_checksum
        .tr(),
    'storage/canceled': LocaleKeys.firebase_errors_storage_canceled.tr(),
    'storage/invalid-event-name': LocaleKeys
        .firebase_errors_storage_invalid_event_name
        .tr(),
    'storage/invalid-url': LocaleKeys.firebase_errors_storage_invalid_url.tr(),
    'storage/invalid-argument': LocaleKeys
        .firebase_errors_storage_invalid_argument
        .tr(),
    'storage/no-default-bucket': LocaleKeys
        .firebase_errors_storage_no_default_bucket
        .tr(),
    'storage/cannot-slice-blob': LocaleKeys
        .firebase_errors_storage_cannot_slice_blob
        .tr(),
    'storage/server-file-wrong-size': LocaleKeys
        .firebase_errors_storage_server_file_wrong_size
        .tr(),
  };

  // Firebase Cloud Functions error messages
  static final Map<String, String> cloudFunctionsMessages = {
    'functions/ok': LocaleKeys.firebase_errors_functions_ok.tr(),
    'functions/cancelled': LocaleKeys.firebase_errors_functions_cancelled.tr(),
    'functions/unknown': LocaleKeys.firebase_errors_functions_unknown.tr(),
    'functions/invalid-argument': LocaleKeys
        .firebase_errors_functions_invalid_argument
        .tr(),
    'functions/deadline-exceeded': LocaleKeys
        .firebase_errors_functions_deadline_exceeded
        .tr(),
    'functions/not-found': LocaleKeys.firebase_errors_functions_not_found.tr(),
    'functions/already-exists': LocaleKeys
        .firebase_errors_functions_already_exists
        .tr(),
    'functions/permission-denied': LocaleKeys
        .firebase_errors_functions_permission_denied
        .tr(),
    'functions/resource-exhausted': LocaleKeys
        .firebase_errors_functions_resource_exhausted
        .tr(),
    'functions/failed-precondition': LocaleKeys
        .firebase_errors_functions_failed_precondition
        .tr(),
    'functions/aborted': LocaleKeys.firebase_errors_functions_aborted.tr(),
    'functions/out-of-range': LocaleKeys.firebase_errors_functions_out_of_range
        .tr(),
    'functions/unimplemented': LocaleKeys
        .firebase_errors_functions_unimplemented
        .tr(),
    'functions/internal': LocaleKeys.firebase_errors_functions_internal.tr(),
    'functions/unavailable': LocaleKeys.firebase_errors_functions_unavailable
        .tr(),
    'functions/data-loss': LocaleKeys.firebase_errors_functions_data_loss.tr(),
    'functions/unauthenticated': LocaleKeys
        .firebase_errors_functions_unauthenticated
        .tr(),
  };

  // General Firebase error messages (if you want them localized too)
  static final String firebaseGenericError = LocaleKeys
      .firebase_errors_generic_error
      .tr();
  static final String firebaseNetworkError = LocaleKeys
      .firebase_errors_network_error
      .tr();
  static final String firebaseTimeoutError = LocaleKeys
      .firebase_errors_timeout_error
      .tr();
}