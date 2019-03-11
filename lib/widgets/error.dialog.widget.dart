import 'package:bugify/config/theme.dart';
import 'package:flutter/material.dart';

class ErrorDialogWidget extends StatelessWidget {
  ErrorDialogWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: Text('ERROR', style: TextStyle(color: ThemeConfig.errorColor),),
        content: Text('invalid credential'),
      ),
    );
  }
}
