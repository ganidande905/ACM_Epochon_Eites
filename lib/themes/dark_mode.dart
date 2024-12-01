import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  fontFamily: 'Poppins',
  colorScheme: ColorScheme.light(
    surface: const Color.fromRGBO(111, 148, 107, 1.0),
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade100,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade700,

  ),
    textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 16.0),
    bodyLarge: TextStyle(fontSize: 18.0),
  )
);