import 'package:flutter/material.dart';

const colors = <Color>[
  Colors.lightBlue,
  Colors.indigo,
  Colors.deepPurple,
  Colors.purple,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Menor'),
        assert(selectedColor < colors.length - 1, 'Mayor');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colors[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: true));
}
