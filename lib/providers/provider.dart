import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UiProvider extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;
  late SharedPreferences storage;

  final darktheme = ThemeData(
    primaryColor: Colors.black12,
    brightness: Brightness.dark,
    primaryColorDark: Colors.black12,
    scaffoldBackgroundColor: Colors.black, // Set dark theme background
  );
  final lighttheme = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
    primaryColorDark: Colors.white,
    scaffoldBackgroundColor: Colors.white, // Set light theme background
  );

  changeTheme() {
    _isDark = !_isDark;
    storage.setBool('isDark', _isDark); // Save the current theme preference
    notifyListeners();
  }

  init() async {
    storage = await SharedPreferences.getInstance();
    _isDark = storage.getBool('isDark') ?? false; // Load saved theme preference
    notifyListeners();
  }
}
