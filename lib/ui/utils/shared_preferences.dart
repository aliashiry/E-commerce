import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({required String Key, required dynamic value}) {
    if (value is int) {
      return sharedPreferences.setInt(Key, value);
    } else if (value is double) {
      return sharedPreferences.setDouble(Key, value);
    } else if (value is String) {
      return sharedPreferences.setString(Key, value);
    } else {
      return sharedPreferences.setBool(Key, value);
    }
  }

  static Object? getData({required String Key}) {
    return sharedPreferences.get(Key);
  }

  static Future<bool> removeData({required String Key}) {
    return sharedPreferences.remove(Key);
  }
}
