import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import 'app_shared_keys.dart';

class LocalHelper {
  LocalHelper(this._pref) {
    log('SharedPreferences initialized successfully.', name: 'LocalHelper');
  }

  final SharedPreferences _pref;

  /// Retrieves the string representation of an [AppSharedKey].
  ///
  /// Parameters:
  ///   - key: The [AppSharedKey] enum value.
  /// Returns:
  ///   - A [String] representing the key name.
  String _getKeyString(AppSharedKey key) {
    final keyString = key.toString().split('.').last;
    return keyString;
  }

  // static Future<void> init() async {
  //   _pref = await SharedPreferences.getInstance();
  //   debugPrint('SharedPreferences initialized successfully.');
  // }

  /// Stores a value in shared preferences using the specified key.
  /// Supports [String], [bool], [int], [double], and [List<String>] types.
  ///
  /// Parameters:
  ///   - key: The [AppSharedKey] to store the value under.
  ///   - value: The value to store (must match supported types).
  /// Returns:
  ///   - A [Future<bool>] indicating success (true) or failure (false).
  Future<bool> setValue({
    required AppSharedKey key,
    required Object value,
  }) async {
    log('Setting value for key: $key, value: $value', name: 'LocalHelper');
    try {
      final keyString = _getKeyString(key);
      bool result;
      if (value is String) {
        result = await _pref.setString(keyString, value);
      } else if (value is bool) {
        result = await _pref.setBool(keyString, value);
      } else if (value is int) {
        result = await _pref.setInt(keyString, value);
      } else if (value is double) {
        result = await _pref.setDouble(keyString, value);
      } else if (value is List<String>) {
        result = await _pref.setStringList(keyString, value);
      } else {
        log(
          'Unsupported type for key $keyString: ${value.runtimeType}',
          name: 'LocalHelper',
        );
        return false;
      }
      log(
        'Set value for $keyString: $value, success: $result',
        name: 'LocalHelper',
      );
      return result;
    } on Exception catch (e) {
      log('Failed to set value for $key: $e', name: 'LocalHelper');
      return false;
    }
  }

  /// Retrieves a value from shared preferences using the specified key.
  ///
  /// Parameters:
  ///   - key: The [AppSharedKey] to retrieve.
  ///   - defaultValue: The value to return if the key is not found.
  dynamic getValue({required AppSharedKey key}) {
    final keyString = _getKeyString(key);
    final value = _pref.get(keyString);
    log('Retrieved value for $keyString: $value', name: 'LocalHelper');
    return value;
  }

  /// Removes a value from shared preferences.
  ///
  /// Parameters:
  ///   - key: The [AppSharedKey] to remove.
  /// Returns:
  ///   - A [Future<bool>] indicating success (true) or failure (false).
  Future<bool> removeValue({required AppSharedKey key}) async {
    try {
      final keyString = _getKeyString(key);
      final result = await _pref.remove(keyString);
      log(
        'Removed value for $keyString, success: $result',
        name: 'LocalHelper',
      );
      return result;
    } on Exception catch (e) {
      log('Failed to remove value for $key: $e', name: 'LocalHelper');
      return false;
    }
  }

  /// Clears all shared preferences.
  ///
  /// Returns:
  ///   - A [Future<bool>] indicating success (true) or failure (false).
  Future<bool> clearAll() async {
    try {
      final result = await _pref.clear();
      log(
        'Cleared all shared preferences, success: $result',
        name: 'LocalHelper',
      );
      return result;
    } on Exception catch (e) {
      log('Failed to clear shared preferences: $e', name: 'LocalHelper');
      return false;
    }
  }

  bool exists({required AppSharedKey key}) {
    log('Checking if key exists: $key', name: 'LocalHelper');

    final keyString = _getKeyString(key);

    log('Key exists: ${_pref.containsKey(keyString)}', name: 'LocalHelper');
    return _pref.containsKey(keyString);
  }
}

//calling the shared preference
/*

    onpressed : (){
    SharedHelper.set(key:"islogin" , value : true);
    }

*/

// /// The global instance of GetIt for dependency injection.
// final getIt = GetIt.instance;
//
// Future<void> setupServiceLocator() async {
//   try {
//     // SharedPreferences
//     final sharedPrefs = await SharedPreferences.getInstance();
//     getIt.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
//     getIt.registerLazySingleton<LocalHelper>(
//           () => LocalHelper(getIt<SharedPreferences>()),
//     );
