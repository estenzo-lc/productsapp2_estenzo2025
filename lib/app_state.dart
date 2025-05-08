import 'package:flutter/material.dart';

enum AppLanguage { english, filipino }

class AppState extends ChangeNotifier {
  AppLanguage _language = AppLanguage.english;
  Color _themeColor = const Color(0xFFF7D2FF); // Default color

  AppLanguage get language => _language;
  Color get themeColor => _themeColor;

  void setLanguage(AppLanguage lang) {
    _language = lang;
    notifyListeners();
  }

  void setThemeColor(Color color) {
    _themeColor = color;
    notifyListeners();
  }

  String translate(String key) {
    final translations = {
      'welcome': {
        AppLanguage.english: 'Welcome to Our Clothing Store!',
        AppLanguage.filipino: 'Maligayang pagdating sa aming Tindahan ng Damit!',
      },
      'shopNow': {
        AppLanguage.english: 'Shop Now',
        AppLanguage.filipino: 'Mamili Ngayon',
      },
      'home': {
        AppLanguage.english: 'Home',
        AppLanguage.filipino: 'Bahay',
      },
      'categories': {
        AppLanguage.english: 'Categories',
        AppLanguage.filipino: 'Mga Kategorya',
      },
      'cart': {
        AppLanguage.english: 'Cart',
        AppLanguage.filipino: 'Kart',
      },
      'profile': {
        AppLanguage.english: 'Profile',
        AppLanguage.filipino: 'Profile',
      },
      'language': {
        AppLanguage.english: 'Language',
        AppLanguage.filipino: 'Wika',
      },
      'theme': {
        AppLanguage.english: 'Theme',
        AppLanguage.filipino: 'Tema',
      },
    };

    return translations[key]?[language] ?? key;
  }
}
