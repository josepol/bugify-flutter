import 'package:bugify/store/bugs/bug.model.dart';
import 'package:bugify/store/bugs/bugs.bloc.dart';
import 'package:flutter/material.dart';

class BugDetailScreen extends StatefulWidget {
  BugDetailScreen({Key key}) : super(key: key);

  _BugDetailScreenState createState() => _BugDetailScreenState();
}

class _BugDetailScreenState extends State<BugDetailScreen> {
  BugsBloc bugsBloc = BugsBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: this.bugsBloc.bugSelected,
      initialData: BugModel(),
      builder: (BuildContext context, AsyncSnapshot<BugModel> snapshot) {
        print('-----> ${snapshot.data.title}');
        return Scaffold(
            appBar: AppBar(
              title: Text('Bug title'),
            ),
            body: Container(
              child: Center(
                child: Text(''),
              ),
            ));
      },
    );
  }
}
