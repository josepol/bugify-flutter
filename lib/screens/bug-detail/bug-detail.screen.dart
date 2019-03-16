import 'package:flutter/material.dart';

class BugDetailScreen extends StatefulWidget {

  BugDetailScreen({Key key}) : super(key: key);

  _BugDetailScreenState createState() => _BugDetailScreenState();
}

class _BugDetailScreenState extends State<BugDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bug title'),
      ),
      body: Container(
        child: Center(
          child: Text('data'),
        ),
      ),
    );
  }
}