import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class Mythemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: kDarkBackground,
    colorScheme: const ColorScheme.dark(
      primary: kLightBackground,
      secondary: accentcolor,
      onBackground: Colors.purple,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onTertiary: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: kDarkPrimaryColor,
    ),
    primarySwatch: Colors.purple,
    accentColor: Colors.amber,
    listTileTheme: ListTileThemeData(
      tileColor: kContainerDarkColor,
      selectedColor: kDarkPrimaryColor,
    ),
    cardTheme: CardTheme(
      color: kContainerDarkColor,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: kContainerDarkColor,
      actionTextColor: kDarkSunColor,
      contentTextStyle: const TextStyle(
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: kDarkPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: kDarkPrimaryColor,
      ),
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: kLightBackground,
    colorScheme: const ColorScheme.light(
      primary: Colors.purple,
      secondary: accentcolor,
    ),
    primarySwatch: Colors.purple,
    accentColor: Colors.amber,
    listTileTheme: ListTileThemeData(
      tileColor: Colors.white,
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
