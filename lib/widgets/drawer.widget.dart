import 'package:bugify/config/constants.dart';
import 'package:bugify/config/theme.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {

  BuildContext _context;

  DrawerWidget({Key key}) : super(key: key);

  void navigateProfile() {
    Navigator.popAndPushNamed(this._context, '/profile');
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: this.navigateProfile,
                  child: Container(
                    width: 60,
                    height: 60,
                    child: Icon(Icons.person, color: Colors.white),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: ThemeConfig.primaryColor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 12, left: 10),
                  child: Text('email'),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: ThemeConfig.secondaryHeaderColor,
            ),
          ),
          ListTile(
            leading: Icon(Icons.bug_report, color: ThemeConfig.primaryColor),
            title: Text('Bugs'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, Constants.HOME_ROUTE);
            },
          ),
          /*ListTile(
                leading: Icon(Icons.code, color: ThemeConfig.primaryColor),
                title: Text('Snippets'),
                onTap: () {
                  Navigator.pop(context);
                },
              )*/
        ],
      ),
    );
  }
}
