import 'package:flutter/material.dart';

class SnackBarWidget {
  static openSnack({BuildContext context, String type, String text}) {
    Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        content: Container(
          decoration: BoxDecoration(),
          child: Text(
            text,
            style: TextStyle(color: _getTextColor(type)),
          ),
        )));
  }

  static Color _getTextColor(String type) {
    switch (type) {
      case 'success':
        return Colors.green;
      case 'warning':
        return Colors.yellow;
      case 'error':
        return Colors.red;
      default:
        return Colors.green;
    }
  }
}
