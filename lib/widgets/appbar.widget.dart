import 'package:flutter/material.dart';

class AppbarWidget extends StatefulWidget implements PreferredSizeWidget {

  final Function actionCallback;
  final IconData actionIcon;
  final String title;

  AppbarWidget({Key key, this.actionCallback, this.title, this.actionIcon}) : super(key: key);

  _AppbarWidgetState createState() => _AppbarWidgetState();

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}

class _AppbarWidgetState extends State<AppbarWidget> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(this.widget.title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.lock_outline),
          onPressed: this.widget.actionCallback,
        )
      ],
    );
  }
}
