import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: false,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.black),
    titleMedium: TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
  ),
);

final darkTheme = ThemeData.dark(
  useMaterial3: false,
).copyWith(
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
