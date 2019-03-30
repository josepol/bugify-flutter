import 'package:bugify/config/theme.dart';
import 'package:bugify/screens/bug-detail/bug-detail.screen.dart';
import 'package:bugify/store/bugs/bug.model.dart';
import 'package:flutter/material.dart';

class ListBugsWidget extends StatefulWidget {
  final List<BugModel> bugs;

  ListBugsWidget({Key key, this.bugs}) : super(key: key);

  _ListBugsWidgetState createState() => _ListBugsWidgetState();
}

class _ListBugsWidgetState extends State<ListBugsWidget> {
  @override
  void initState() {
    super.initState();
  }

  void navigateToBugDetail(BugModel bug) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BugDetailScreen(bug: bug),
      ),
    );
  }

  GridTile _getGridTile(BugModel bug) {
    return GridTile(
      header: Container(
        child: Center(
          child: Text(bug.title, style: TextStyle(color: Colors.white), overflow: TextOverflow.ellipsis),
        ),
      ),
      child: InkWell(
        onTap: () => this.navigateToBugDetail(bug),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: ThemeConfig.secondaryHeaderColor),
            padding: EdgeInsets.only(top: 30),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(children: <Widget>[
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(bug.description, overflow: TextOverflow.ellipsis)
                  ],
                ),
              ),
            ])
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: OrientationBuilder(builder: (context, orientation) {
      bool isPortrait = orientation == Orientation.portrait;
      return GridView.count(
          crossAxisCount: isPortrait ? 2 : 4,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(10),
          childAspectRatio: 1.5,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: this.widget.bugs != null
              ? this.widget.bugs.map((BugModel bug) {
                  return _getGridTile(bug);
                }).toList()
              : []);
    }));
  }
}
