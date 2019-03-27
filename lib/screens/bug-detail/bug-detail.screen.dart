import 'package:bugify/store/bugs/bug.model.dart';
import 'package:bugify/store/bugs/bugs.bloc.dart';
import 'package:flutter/material.dart';

class BugDetailScreen extends StatefulWidget {
  BugDetailScreen({Key key}) : super(key: key);

  _BugDetailScreenState createState() => _BugDetailScreenState();
}

class _BugDetailScreenState extends State<BugDetailScreen> {
  BugModel _bugSelected = BugModel();

  @override
  void initState() {
    super.initState();
    bugsBloc.bugSelected.listen((bug) => this._setBugSelected(bug));
  }

  void _setBugSelected(BugModel bugSelected) {
      this.setState(() => this._bugSelected = bugSelected);
  }

  @override
  Widget build(BuildContext context) {
    print('----------------------------------------------------');
    print(this._bugSelected.toJson());
    return Scaffold(
        appBar: AppBar(
          title: Text(this._bugSelected.title != null ? this._bugSelected.title : ''),
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
