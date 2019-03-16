import 'package:flutter/material.dart';

class AddBugScreen extends StatefulWidget {

  AddBugScreen({Key key}) : super(key: key);

  _AddBugScreenState createState() => _AddBugScreenState();
}

class _AddBugScreenState extends State<AddBugScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add bug'),
      ),
      body: Container(
        child: Center(
          child: Text('data'),
        ),
      ),
    );
  }
}