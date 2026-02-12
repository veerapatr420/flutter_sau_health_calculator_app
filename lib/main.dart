import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'views/splash_screen_ui.dart';

void main() {
  runApp(
    FlutterSauHealthCalculatorApp(),
  );
}

class FlutterSauHealthCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme:ThemeData(
        textTheme: GoogleFonts.promptTextTheme(),
      )
    );
  }
}

