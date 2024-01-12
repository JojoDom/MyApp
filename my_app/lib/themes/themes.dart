import 'package:flutter/material.dart';
class Themes {
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: Colors.lightGreen,
    ),
  ).copyWith(primaryColor:  Colors.lightGreen,
  scaffoldBackgroundColor: const Color(0xFFF2F4F7));
  static final darkTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
       primary: Colors.lightGreen,
    )).copyWith(primaryColor:  Colors.lightGreen,
  scaffoldBackgroundColor: const Color(0xFFF2F4F7));
}