import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
      ),
      fontFamily: GoogleFonts.lato().fontFamily,
      primarySwatch: Colors.deepPurple,
      primaryTextTheme: GoogleFonts.latoTextTheme(),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
    );
  }
}
