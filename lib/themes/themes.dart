import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  primaryColor: Colors.deepPurple,
  useMaterial3: false,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.deepPurple,
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.white),
    titleMedium: TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.deepPurple,
  ),
);

final darkTheme = ThemeData.dark(
  useMaterial3: false,
).copyWith(
  primaryColor: Colors.deepPurple,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.deepPurple,
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  primaryIconTheme: IconThemeData(
    color: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Colors.deepPurple),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.deepPurple,
  ),
);
