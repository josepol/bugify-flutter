import 'package:bugify/store/bugs/bug.model.dart';
import 'package:flutter/material.dart';

class BugDetailScreen extends StatefulWidget {

  final BugModel bug;

  BugDetailScreen({Key key, this.bug}) : super(key: key);

  _BugDetailScreenState createState() => _BugDetailScreenState();
}

class _BugDetailScreenState extends State<BugDetailScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.widget.bug.title != null ? this.widget.bug.title : ''),
        ),
        body: Container(
          child: Center(
            child: Text(''),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
