import 'package:flutter/material.dart';

class Themes {
  static final ThemeData mainTheme = ThemeData(
    primarySwatch: Colors.purple,
    accentColor: Colors.amber,
    fontFamily: 'Quicksand',
    textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
    appBarTheme: AppBarTheme(
      textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
    ),
  );
}
