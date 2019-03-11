import 'package:flutter/material.dart';

class ThemeConfig {
  static final Color primaryColor = Color.fromRGBO(101, 106, 219, 1);

  static final List<double> backgroundGradientStops = [0.1, 0.5, 0.7, 0.9];

  static final List<Color> backgroundGradientColor = [
    Color.fromRGBO(101, 106, 219, 0.8),
    Color.fromRGBO(101, 106, 219, 0.6),
    Color.fromRGBO(101, 106, 219, 0.4),
    Color.fromRGBO(101, 106, 219, 0.2)
  ];

  static final Color errorColor = Colors.red;
  static final Color warningColor = Colors.yellow;

  static final Color secondaryHeaderColor = Color.fromRGBO(101, 106, 219, 0.4);
}