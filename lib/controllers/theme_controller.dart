import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ChangeNotifier {
  final SharedPreferences sharedPreferences;

  bool darkTheme = false;

  ThemeController({
    required this.sharedPreferences,
  });

  void toggleTheme(bool value) async {
    darkTheme = !darkTheme;
    await sharedPreferences.setBool("theme", darkTheme);
    notifyListeners();
  }

  Future<void> getTheme() async {
    final theme = sharedPreferences.getBool("theme");

    if (theme != null) {
      darkTheme = theme;
      notifyListeners();
    }
  }
}
