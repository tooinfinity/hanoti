import 'package:flutter/material.dart';
import 'package:hanoti/services/storage/locale_storage.dart';

class AppLanguage extends ChangeNotifier {
  String currentLanguage;
  Locale _appLocale;

  Locale get appLocal => _appLocale;

  AppLanguage() {
    _appLocale = Locale('en');
    _appLocale = LocalStorage.getLocale();
  }

  void changeLanguage(String lang) async {
    Locale newLocale;
    newLocale = stringToLocale(lang);
    _appLocale = await LocalStorage.setLocale(newLocale.languageCode);
    notifyListeners();
  }

  stringToLocale(String langNameToConvert) {
    Locale convertedLocale;

    switch (langNameToConvert) {
      case 'English':
        convertedLocale = Locale('en', 'EN');
        break;
      case 'Français':
        convertedLocale = Locale('fr', 'FR');
        break;
      case 'العربية':
        convertedLocale = Locale('ar', 'DZ');
        break;
      default:
        convertedLocale = Locale('en', 'EN');
    }

    return convertedLocale;
  }

  localeToString(Locale localeToConvert) {
    String langName;

    switch (localeToConvert.languageCode) {
      case 'en':
        langName = "English";
        break;
      case 'fr':
        langName = "Français";
        break;
      case 'ar':
        langName = "العربية";
        break;
      default:
        langName = "English";
    }

    return langName;
  }
}
