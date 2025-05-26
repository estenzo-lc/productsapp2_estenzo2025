import 'package:flutter/material.dart';

class Backgroundmodel extends ChangeNotifier {
  String _currentTheme = "default";

  // Theme colors based on your custom pastel palette
  Color _scaffoldBgColor = const Color(0xFFF7D2FF); // Light pink
  Color _appBarColor = const Color(0xFFBEC1FF);     // Lavender blue
  Color _drawerHeaderColor = const Color(0xFFC8B3FF); // Soft purple
  Color _buttonColor = const Color(0xFFC0D7FF);     // Light blue
  Color _accentColor = const Color(0xFFC3F9FF);     // Light cyan
  Color _textColor = const Color(0xFF6A5ACD);       // Keep readable contrast
  Color _secondBtn = const Color(0xFFBEC1FF);
  Color _buyBtn = const Color(0xFFF7D2FF);
  Color _cartBtn = const Color(0xFFC8B3FF);
  Color _ratingColor = const Color.fromARGB(100, 200, 179, 255); // Transparent soft purple

  void applyPastelTheme() {
    _currentTheme = "pastel";
    _scaffoldBgColor = const Color(0xFFF7D2FF);
    _appBarColor = const Color(0xFFBEC1FF);
    _drawerHeaderColor = const Color(0xFFC8B3FF);
    _buttonColor = const Color(0xFFC0D7FF);
    _accentColor = const Color(0xFFC3F9FF);
    _textColor = const Color(0xFF6A5ACD);
    _secondBtn = const Color(0xFFBEC1FF);
    _buyBtn = const Color(0xFFF7D2FF);
    _cartBtn = const Color(0xFFC8B3FF);
    _ratingColor = const Color.fromARGB(100, 200, 179, 255);
    notifyListeners();
  }

  void reset() {
    _currentTheme = "default";
    _scaffoldBgColor = const Color(0xFFF7D2FF);
    _appBarColor = const Color(0xFFBEC1FF);
    _drawerHeaderColor = const Color(0xFFC8B3FF);
    _buttonColor = const Color(0xFFC0D7FF);
    _accentColor = const Color(0xFFC3F9FF);
    _textColor = const Color(0xFF6A5ACD);
    _secondBtn = const Color(0xFFBEC1FF);
    _buyBtn = const Color(0xFFF7D2FF);
    _cartBtn = const Color(0xFFC8B3FF);
    _ratingColor = const Color.fromARGB(100, 200, 179, 255);
    notifyListeners();
  }

  // Method to set the theme color
  void setThemeColor(Color color) {
    _scaffoldBgColor = color; // Update the background color
    notifyListeners(); // Notify listeners about the change
  }

  // Getters
  Color get background => _scaffoldBgColor;
  Color get appBar => _appBarColor;
  Color get drawerHeader => _drawerHeaderColor;
  Color get button => _buttonColor;
  Color get accent => _accentColor;
  Color get textColor => _textColor;
  Color get secondBtn => _secondBtn;
  Color get buyBtn => _buyBtn;
  Color get cartBtn => _cartBtn;
  Color get ratingColor => _ratingColor;

  String get theme => _currentTheme;
}