import 'package:flutter/material.dart';
import '../utils/create_swatch.dart';

ThemeData lightTheme() {
  return ThemeData(
      primarySwatch: genSwatch(const Color(0xff00a1d3)),
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Color(0xff626262),
        ),
        bodyText1: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xff626262),
        ),
        headline6: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xff626262),
        ),
        headline2: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xff626262),
        ),
      ),
      buttonTheme: ButtonThemeData(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(99999),
        ),
      ),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff626262),
            fontSize: 20),
        color: Color(0xffffffff),
        actionsIconTheme: IconThemeData(
          color: Color(0xff00a1d3),
        ),
        iconTheme: IconThemeData(
          color: Color(0xff00a1d3),
        ),
      ),
      cardTheme: CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xffECEEF4),
      fontFamily: "Inter");
}
