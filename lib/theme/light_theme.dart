import 'package:flutter/material.dart';
import 'package:guard_app/utils/create_swatch.dart';

ThemeData lightTheme() {
  return ThemeData(
    primarySwatch: genSwatch(const Color(0xff00a1d3)),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Color(0xff353535),
      ),
      bodyText1: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xff353535),
      ),
      headline6: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xff353535),
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
      color: Color(0xffffffff),
      actionsIconTheme: IconThemeData(
        color: Color(0xff00a1d3),
      ),
      iconTheme: IconThemeData(
        color: Color(0xff00a1d3),
      ),
    ),
    backgroundColor: const Color(0xffF7F9FD),
    fontFamily: "Inter"
  );
}
