import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {

  bool _isDark = true;

  bool get isDark => _isDark;

  ThemeData get themeData {

    if (_isDark) {

      /// DARK THEME

      return ThemeData(

        brightness: Brightness.dark,

        scaffoldBackgroundColor:
        const Color(0xFF1E1E1E),

        appBarTheme: const AppBarTheme(
          backgroundColor:
          Color(0xFF1E1E1E),
          foregroundColor:
          Colors.white,
        ),

        elevatedButtonTheme:
        ElevatedButtonThemeData(

          style: ElevatedButton.styleFrom(
            backgroundColor:
            const Color(0xFF424242),
            foregroundColor:
            Colors.white,
            shape:
            RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(16),
            ),
          ),

        ),

      );

    } else {

      /// LIGHT THEME

      return ThemeData(

        brightness: Brightness.light,

        scaffoldBackgroundColor:
        Colors.grey[200],

        appBarTheme: const AppBarTheme(
          backgroundColor:
          Colors.white,
          foregroundColor:
          Colors.black,
        ),

        elevatedButtonTheme:
        ElevatedButtonThemeData(

          style: ElevatedButton.styleFrom(
            backgroundColor:
            Colors.white,
            foregroundColor:
            Colors.black,
          ),

        ),

      );

    }

  }

  /// TOGGLE THEME

  Future<void> toggleTheme() async {

    _isDark = !_isDark;

    final prefs =
    await SharedPreferences.getInstance();

    prefs.setBool("isDark", _isDark);

    notifyListeners();

  }

  /// LOAD THEME

  Future<void> loadTheme() async {

    final prefs =
    await SharedPreferences.getInstance();

    _isDark =
        prefs.getBool("isDark") ?? true;

    notifyListeners();

  }

}