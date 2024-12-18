import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  const SharedHelper._();

  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> set({required String key, required dynamic value}) async {
    switch (value.runtimeType) {
      case const (int):
        await _prefs.setInt(key, value as int);
      case const (double):
        await _prefs.setDouble(key, value as double);
      case const (String):
        await _prefs.setString(key, value as String);
      case const (bool):
        await _prefs.setBool(key, value as bool);
      case const (List<String>):
        await _prefs.setStringList(key, value as List<String>);
      default:
        throw UnsupportedError(
          'Unsupported data type for SharedPreference: ${value.runtimeType}',
        );
    }
  }

  static dynamic get({required String key}) async => _prefs.get(key) ?? false;

  static Future<void> remove({required String key}) async {
    await _prefs.remove(key);
  }

  static Future<void> clearAllData() async {
    await _prefs.clear();
  }

  static bool exists({required String key}) {
    return _prefs.containsKey(key);
  }
}
