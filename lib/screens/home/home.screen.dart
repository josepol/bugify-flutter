import 'dart:convert';

import 'package:bugify/bug.model.dart';
import 'package:bugify/config/constants.dart';
import 'package:bugify/screens/home/home.provider.dart';
import 'package:bugify/screens/home/widgets/list-bugs.widget.dart';
import 'package:bugify/widgets/appbar.widget.dart';
import 'package:bugify/widgets/confirmation.widget.dart';
import 'package:bugify/widgets/drawer.widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  final Widget child;

  HomeScreen({Key key, this.child}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String token;
  List<BugModel> bugs;
  SharedPreferences sharedPreferences;
  HomeProvider homeProvider = HomeProvider();

  void initState() {
    super.initState();
    this.getToken().then((token) => {this.getBugs()});
  }

  Future getToken() async {
    this.getSharedPreferences().then((sharedPreferences) {
      this.sharedPreferences = sharedPreferences;
      String token = this.sharedPreferences.getString(Constants.TOKEN_REF);
      this.setState(() {
        this.token = token;
      });
      return Future.value(this.token);
    });
  }

  Future<SharedPreferences> getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  void getBugs() {
    this.homeProvider.getBugs().then((response) {
      if (response.statusCode == 200) {
        List<Map> responseJson = json.decode(response.body);
        responseJson.map((r) {
          BugModel bug = BugModel.fromJson(r);
          this.bugs.add(bug);
        });
        print(this.bugs);
      } else {
        print(response);
      }
    });
  }

  void logout() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmationDialogWidget(
            okCallback: () {
              Navigator.pushReplacementNamed(context, Constants.LOGIN_ROUTE);
              this.sharedPreferences.clear();
            },
            cancelCallback: () {},
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWidget(
            actionCallback: this.logout,
            actionIcon: Icons.lock_outline,
            title: 'Bugs!'),
        body: Column(
          children: <Widget>[ListBugsWidget()],
        ),
        drawer: DrawerWidget());
  }
}
