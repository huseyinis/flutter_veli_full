import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor;
  late ThemeData theme;
  LightTheme() {
    theme = ThemeData(
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.green),
        buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.light(
          onPrimary: Colors.purple,
        )),
        colorScheme: ColorScheme.light(),
        textTheme: ThemeData.light().textTheme.copyWith(
              subtitle1: TextStyle(fontSize: 25, color: _LightColor()._textColor),
            ));
  }
}

class _LightColor {
  final Color _textColor = Colors.redAccent;
}
