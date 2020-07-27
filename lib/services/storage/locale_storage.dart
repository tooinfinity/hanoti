import 'package:flutter/material.dart';
import 'package:hanoti/localization/language_consts.dart';
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

  // Write from shared prefrences String values
  static Future<bool> setItem(String key, String value) {
    return _sharedPreferences.setString(key, value);
  }

  // Read from shared prefrences String value
  static String getItem(String key) {
    return _sharedPreferences.getString(key);
  }

  // Write from shared prefrences boolean values
  static Future<bool> setBool(String key, value) {
    return _sharedPreferences.setBool(key, value);
  }

  // Read from shared prefrences boolean value
  static bool getBool(String key) {
    return _sharedPreferences.getBool(key);
  }

  static Future<Locale> setLocale(String languageCode) async {
    await _sharedPreferences.setString(LAGUAGE_CODE, languageCode);
    return _locale(languageCode);
  }

  static Locale getLocale() {
    String languageCode = _sharedPreferences.getString(LAGUAGE_CODE);
    return _locale(languageCode);
  }

  static Locale _locale(String languageCode) {
    switch (languageCode) {
      case ENGLISH:
        return Locale(ENGLISH, 'US');
      case FRANCAIS:
        return Locale(FRANCAIS, "FR");
      case ARABIC:
        return Locale(ARABIC, "DZ");
      default:
        return Locale(ENGLISH, 'US');
    }
  }
}
