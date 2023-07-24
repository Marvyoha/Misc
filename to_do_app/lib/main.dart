import 'package:flutter/material.dart';
import 'package:to_do_app/home.dart';
import 'package:to_do_app/splashScreen.dart';
import 'package:to_do_app/themes.dart';

void main() {
  ThemeClass myTheme = ThemeClass();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: myTheme.theme,
    home: const Home(),
  ));
}
