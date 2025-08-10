import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  CacheHelper._();

  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setData<T>(String key, T value) async {
    switch (value) {
      case String():
        await _prefs.setString(key, value);
      case int():
        await _prefs.setInt(key, value);
      case double():
        await _prefs.setDouble(key, value);
      case bool():
        await _prefs.setBool(key, value);
      default:
        throw UnimplementedError('setData for type ${value.runtimeType} is not implemented');
    }
  }

  static Future<String> getString(
    String key, {
    String defaultValue = '',
  }) async {
    return _prefs.getString(key) ?? defaultValue;
  }

  static Future<int> getInt(String key, {int defaultValue = 0}) async {
    return _prefs.getInt(key) ?? defaultValue;
  }

  static Future<bool> getBool(String key, {bool defaultValue = false}) async {
    return _prefs.getBool(key) ?? defaultValue;
  }

  static Future<void> removeData(String key) async {
    await _prefs.remove(key);
  }

  static Future<void> clearData() async {
    await _prefs.clear();
  }
}
