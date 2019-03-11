import 'package:bugify/config/theme.dart';
import 'package:flutter/material.dart';

class ConfirmationDialogWidget extends StatelessWidget {

  final Function okCallback;
  final Function cancelCallback;

  ConfirmationDialogWidget({Key key, this.okCallback, this.cancelCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        backgroundColor: ThemeConfig.primaryColor,
        title: Text('Confirm!', style: TextStyle(color: Colors.white),),
        content: Text('Are you sure?', style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          FlatButton(
            child: Text('OK', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.of(context).pop();
              this.okCallback();
            },
          ),
          FlatButton(
            child: Text('CANCEL', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.of(context).pop();
              this.cancelCallback();
            },
          )
        ],
      ),
    );
  }
}
