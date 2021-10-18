import 'package:flutter/material.dart';

import 'constants.dart';

class Themes {
  static final ThemeData mainTheme = ThemeData(
    primarySwatch: Colors.purple,
    accentColor: Colors.amber,
    fontFamily: Fonts.quickSand,
    textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: Fonts.openSans,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
    appBarTheme: AppBarTheme(
      textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: Fonts.openSans,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
    ),
  );
}
