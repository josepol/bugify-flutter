import 'package:bugify/config/constants.dart';
import 'package:bugify/config/theme.dart';
import 'package:bugify/screens/home/home.provider.dart';
import 'package:bugify/screens/home/widgets/list-bugs.widget.dart';
import 'package:bugify/store/bugs/bug.model.dart';
import 'package:bugify/store/bugs/bugs.bloc.dart';
import 'package:bugify/store/bugs/bugs.event.dart';
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
  SharedPreferences sharedPreferences;
  HomeProvider homeProvider = HomeProvider();
  BugsBloc bugsBloc = BugsBloc();

  void initState() {
    super.initState();
    this.getToken().then((token) => this._getBugs());
  }

  Future getToken() async {
    this._getSharedPreferences().then((sharedPreferences) {
      this.sharedPreferences = sharedPreferences;
      String token = this.sharedPreferences.getString(Constants.TOKEN_REF);
      this.setState(() {
        this.token = token;
      });
      return Future.value(this.token);
    });
  }

  Future<SharedPreferences> _getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  void _getBugs() {
    this.homeProvider.getBugs().then((response) {
      if (response.statusCode == 200) {
        List<dynamic> bugs = response.data;
        List<BugModel> bugsModeled = List();
        bugs.map((bug) {
          BugModel bugModel = BugModel.fromJson(bug);
          bugsModeled.add(bugModel);
        }).toList();
        this.bugsBloc.bugsEventSink.add(GetBugsEvent(bugsModeled));
      } else {
        print(response);
      }
    });
  }

  void _logout() {
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

  void _addBug() {
    Navigator.pushNamed(context, Constants.ADD_BUG);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWidget(
            actionCallback: this._logout,
            actionIcon: Icons.lock_outline,
            title: 'Bugs!'),
        body: Column(
          children: <Widget>[
            StreamBuilder(
              stream: this.bugsBloc.bugs,
              initialData: List<BugModel>(),
              builder: (BuildContext context, AsyncSnapshot<List<BugModel>> snapshot) {
                return ListBugsWidget(
                  bugs: snapshot.data,
                );
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: this._addBug,
          child: Icon(Icons.add),
          backgroundColor: ThemeConfig.primaryColor,
        ),
        drawer: DrawerWidget());
  }

  @override
  void dispose() {
    // this.bugsBloc.dispose();
    super.dispose();
  }
}
