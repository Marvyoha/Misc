import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class ThemeClass {
  Color primaryColor = Colors.black;
  Color secondaryColor = const Color.fromARGB(255, 255, 17, 0);
  Color accentColor = Colors.grey;

  ThemeData get theme => ThemeData(
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: secondaryColor, selectionColor: secondaryColor),
      scaffoldBackgroundColor: Colors.black,
      primaryColor: ThemeData.dark().scaffoldBackgroundColor,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 255, 17, 0)),
      colorScheme: const ColorScheme.dark().copyWith(
        primary: primaryColor,
        secondary: secondaryColor,
      ),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          foregroundColor: secondaryColor,
          backgroundColor: primaryColor,
          titleTextStyle: const TextStyle(
              color: Color.fromARGB(255, 255, 17, 0), fontSize: 20)),
      dividerTheme: const DividerThemeData(
        color: Color.fromARGB(255, 255, 17, 0),
        thickness: 3,
      ));
}
