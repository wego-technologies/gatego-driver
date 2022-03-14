import 'package:flutter/material.dart';

PageTransitionsTheme pageTransitionsTheme =
    const PageTransitionsTheme(builders: {
  TargetPlatform.android: ZoomPageTransitionsBuilder(),
  TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
});
