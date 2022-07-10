import 'package:clean_demo/Cubit/Core/Const/Colors.dart';
import 'package:flutter/material.dart';

class CustomTheme with ChangeNotifier {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: primaryColorL,
        secondaryHeaderColor: secondaryColorL,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(color: primaryColorL),
        cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        )),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primaryColorL,
        ),
        textTheme: const TextTheme(
            headline6:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            subtitle2: TextStyle(color: Colors.white)),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: secondaryColorL,
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: primaryColorD,
        secondaryHeaderColor: secondaryColorD,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(color: primaryColorD),
        cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        )),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primaryColorD,
        ),
        textTheme: const TextTheme(
            headline6:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            subtitle2: TextStyle(color: Colors.white)),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: secondaryColorD,
        ));
  }

  static bool _isDarkTheme = true;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    print("Theme => $_isDarkTheme");
    notifyListeners();
  }
}
