import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/screens/welcome.dart';
import 'package:my_app/themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MyApp',
      theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        debugShowCheckedModeBanner: false,
      home: const WelcomeScreen()
    );
  }
}

