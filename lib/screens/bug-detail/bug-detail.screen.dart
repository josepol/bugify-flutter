import 'package:bugify/store/bugs/bug.model.dart';
import 'package:bugify/store/bugs/bugs.bloc.dart';
import 'package:flutter/material.dart';

class BugDetailScreen extends StatefulWidget {
  BugDetailScreen({Key key}) : super(key: key);

  _BugDetailScreenState createState() => _BugDetailScreenState();
}

class _BugDetailScreenState extends State<BugDetailScreen> {
  BugsBloc bugsBloc = BugsBloc();
  BugModel _bugSelected = BugModel();

  @override
  void initState() {
    super.initState();
    this.bugsBloc.bugSelected.listen((bug) => this._setBugSelected(bug));
  }

  void _setBugSelected(BugModel bugSelected) {
    if (this.mounted) {
      this.setState(() => this._bugSelected = bugSelected);
    }
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
}
