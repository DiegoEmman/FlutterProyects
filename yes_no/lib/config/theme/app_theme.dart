import 'package:flutter/material.dart';

const List<Color> _colorThemes = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
  ];


class AppTheme {

  int selectedColor;

  AppTheme({this.selectedColor = 0})
  : assert(selectedColor >= 0 && selectedColor < _colorThemes.length, 'selectedColor must be between 0 and ${_colorThemes.length - 1}');

  ThemeData theme(){
    return ThemeData(
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }

}