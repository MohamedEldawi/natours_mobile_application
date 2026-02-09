import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SharedPrefHelper {
  SharedPrefHelper._();
  static Future<void> removeData(String key) async {
    debugPrint('SharedPrefHelper: data with key: $key has been removed');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  static Future<void> clearAllData() async {
    debugPrint('SharedPrefHelper: all data has been cleared');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  static Future<void> setData(String key, value) async {
    debugPrint('SharedPrefHelper: set data with key: $key to value: $value');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    switch (value.runtimeType) {
      case String:
        await sharedPreferences.setString(key, value);
        break;
      case int:
        await sharedPreferences.setInt(key, value);
        break;
      case bool:
        await sharedPreferences.setBool(key, value);
        break;
      case double:
        await sharedPreferences.setDouble(key, value);
        break;
      default:
        return;
    }
  }

  static Future<String> getString(String key) async {
    debugPrint('SharedPrefHelper: getString with key: $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? '';
  }

  static Future<double> getDouble(String key) async {
    debugPrint('SharedPrefHelper: getDouble with key: $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key) ?? 0;
  }

  static Future<int> getInt(String key) async {
    debugPrint('SharedPrefHelper: getInt with key: $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key) ?? 0;
  }

  static Future<bool> getBool(String key) async {
    debugPrint('SharedPrefHelper: getBool with key: $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }
  // secure storage

  static Future<void> setSecureString(String key, String value) async {
    debugPrint(
      'FlutterSecureStorage: set data with key: $key to value: $value',
    );
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.write(key: key, value: value);
  }

  static Future<String> getSecureString(String key) async {
    debugPrint('FlutterSecureStorage: getSecureString with key: $key');
    const flutterSecureStorage = FlutterSecureStorage();
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  static Future<void> clearAllSecureDate() async {
    debugPrint('FlutterSecureStorage: all Secure data has been cleared');
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }
}
