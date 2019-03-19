import 'package:bugify/config/theme.dart';
import 'package:bugify/store/bugs/bug.model.dart';
import 'package:bugify/store/bugs/bugs.bloc.dart';
import 'package:bugify/store/bugs/bugs.event.dart';
import 'package:flutter/material.dart';

class ListBugsWidget extends StatefulWidget {
  final List<BugModel> bugs;

  ListBugsWidget({Key key, this.bugs}) : super(key: key);

  _ListBugsWidgetState createState() => _ListBugsWidgetState(bugs);
}

class _ListBugsWidgetState extends State<ListBugsWidget> {
  List<BugModel> bugs;
  BugsBloc bugsBloc = BugsBloc();
  _ListBugsWidgetState(this.bugs);

  void navigateToBugDetail(BugModel bug) {
    this.bugsBloc.bugsEventSink.add(SetBugSelected(bug));
    Navigator.pushNamed(context, '/bug-detail');
  }

  @override
  void didUpdateWidget(ListBugsWidget oldWidget) {
    if (this.bugs != widget.bugs) {
      setState(() {
        this.bugs = widget.bugs;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    GridTile _getGridTile(BugModel bug) {
      return GridTile(
        header: Container(
          child: Center(
            child: Text(bug.title, style: TextStyle(color: Colors.white)),
          ),
          height: 30,
        ),
        child: InkResponse(
          onTap: () => this.navigateToBugDetail(bug),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: ThemeConfig.secondaryHeaderColor),
              padding: EdgeInsets.only(top: 30),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(bug.description),
              )),
        ),
      );
    }

    return Expanded(
      child: GridView.count(
          crossAxisCount: 2,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(10),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: this.bugs != null
              ? this.bugs.map((BugModel bug) {
                  return _getGridTile(bug);
                }).toList()
              : []),
    );
  }
}
