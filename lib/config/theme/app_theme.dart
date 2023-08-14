import 'package:flutter/material.dart';

const colors = <Color>[
  Colors.lightBlue,
  Colors.indigo,
  Colors.deepPurple,
  Colors.purple,
];

class AppTheme {
  final int selectedColor;
  final bool darkMode;

  AppTheme({this.selectedColor = 0, this.darkMode = false})
      : assert(selectedColor >= 0, 'Menor'),
        assert(selectedColor < colors.length, 'Mayor');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      brightness: darkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colors[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: true));

  AppTheme copy({
    int? selectedColor,
    bool? darkMode,
  }) =>
      AppTheme(
          selectedColor: selectedColor ?? this.selectedColor,
          darkMode: darkMode ?? this.darkMode);
}
