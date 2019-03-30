import 'package:bugify/config/theme.dart';
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
          title:
              Text(this.widget.bug.title != null ? this.widget.bug.title : ''),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(padding: EdgeInsets.only(top: 10), child: Center(child: Text('Description', style: TextStyle(fontWeight: FontWeight.bold)))),
              Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, style: BorderStyle.solid, color: ThemeConfig.primaryColor),
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Center(child: Text(this.widget.bug.description))),
              Container(padding: EdgeInsets.only(top: 10), child: Center(child: Text('Solution', style: TextStyle(fontWeight: FontWeight.bold)))),
              Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, style: BorderStyle.solid, color: ThemeConfig.primaryColor),
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Center(child: Text(this.widget.bug.solution))),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
