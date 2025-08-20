import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  CacheHelper._();

  static late final SharedPreferences _prefs;
  static const _secureStorage = FlutterSecureStorage();

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
        throw UnimplementedError(
          'setData for type ${value.runtimeType} is not implemented',
        );
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

  static Future<void> setSecureData(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  static Future<String> getSecureData(
    String key, {
    String defaultValue = '',
  }) async {
    return await _secureStorage.read(key: key) ?? defaultValue;
  }

  static Future<void> removeSecureData(String key) async {
    await _secureStorage.delete(key: key);
  }

  static Future<void> clearSecureData() async {
    await _secureStorage.deleteAll();
  }
}
