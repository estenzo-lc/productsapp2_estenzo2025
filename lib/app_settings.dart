import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppSettings extends ChangeNotifier {
  ThemeData _theme = ThemeData(
    primaryColor: AppColors.palette1,
    scaffoldBackgroundColor: AppColors.palette5,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.palette2,
      foregroundColor: Colors.black,
    ),
  );

  Locale _locale = const Locale('en');

  ThemeData get theme => _theme;
  Locale get locale => _locale;

  void setTheme(ThemeData theme) {
    _theme = theme;
    notifyListeners();
  }

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}
