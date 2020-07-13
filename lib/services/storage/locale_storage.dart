import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences _sharedPreferences;

  static LocalStorage _singleton = new LocalStorage._internal();

  factory LocalStorage() {
    return _singleton;
  }

  LocalStorage._internal() {
    // init variables
    initializeSharedPrefrences();
  }

  static Future<void> initializeSharedPrefrences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // Write from shared prefrences
  static Future<bool> setItem(String key, String value) {
    return _sharedPreferences.setString(key, value);
  }

  // Read from shared prefrences
  static String getItem(String key) {
    return _sharedPreferences.getString(key);
  }
}
