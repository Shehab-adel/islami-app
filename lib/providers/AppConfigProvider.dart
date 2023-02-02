import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en'; // Todo:read this value from sharedprefences
  ThemeMode appTheme =
      ThemeMode.light; //  Todo:read this value from sharedprefences

  bool get isDarkMode {
    return appTheme == ThemeMode.dark;
  }

  void changeTheme(ThemeMode newMode) async {
    final prefs = await SharedPreferences.getInstance();
    if (newMode == appTheme) {
      return;
    }
    appTheme = newMode;
    prefs.setString('theme', appTheme == ThemeMode.light ? 'light' : 'dark');
    //Todo:Save this value to sharedprefences
    notifyListeners();
  }

  void changeLanguage(String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    if (langCode == appLanguage) {
      return;
    }
    //Todo:Save this value to sharedprefences
    appLanguage = langCode;
    prefs.setString('language', appLanguage);
    notifyListeners();
  }
}
