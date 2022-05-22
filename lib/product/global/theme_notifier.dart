import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isLighTheme = true;

  void changeTheme() {
    isLighTheme = !isLighTheme;
    notifyListeners();
  }

  ThemeData get currentTheme => isLighTheme ? ThemeData.light() : ThemeData.dark();
}
