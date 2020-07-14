import 'package:flutter/material.dart';
import 'package:hanoti/services/storage/locale_storage.dart';

ThemeData light = ThemeData(
  primarySwatch: Colors.red,
  primaryColor: Colors.white,
  disabledColor: Colors.grey,
  cardColor: Colors.white,
  canvasColor: Colors.white,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    elevation: 0.0,
  ),
);
ThemeData dark = ThemeData(
  primarySwatch: Colors.red,
  primaryColor: Colors.black,
  disabledColor: Colors.grey,
  cardColor: Colors.black,
  canvasColor: Colors.black,
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    elevation: 0.0,
  ),
);

class ThemeNotifier extends ChangeNotifier {
  final String themeKey = "theme";
  bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    _darkTheme = true;
    _darkTheme = LocalStorage.getBool(themeKey) ?? true;
  }
  toggleTheme() async {
    _darkTheme = !_darkTheme;
    await LocalStorage.setBool(themeKey, _darkTheme);
    notifyListeners();
  }
}
