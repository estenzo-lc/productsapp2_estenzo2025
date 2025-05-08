import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  // Theme color
  Color _themeColor = Colors.deepPurple;
  Color get themeColor => _themeColor;

  // Background color
  Color _bgColor = Colors.white;
  Color get bgColor => _bgColor;

  void setThemeColor(Color color) {
    _themeColor = color;
    notifyListeners();
  }

  // Set background color
  void setBgColor(Color color) {
    _bgColor = color;
    notifyListeners();
  }

  // Language setting
  String _language = 'en'; // or 'fil' for Filipino
  String get language => _language;

  void toggleLanguage() {
    _language = _language == 'en' ? 'fil' : 'en';
    notifyListeners();
  }

  // ThemeMode (light/dark optional)
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  void toggleThemeMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
