import 'package:bugify/auth.provider.dart';
import 'package:bugify/config/constants.dart';
import 'package:bugify/config/theme.dart';
import 'package:bugify/screens/add-bug/add-bug.screen.dart';
import 'package:bugify/screens/bug-detail/bug-detail.screen.dart';
import 'package:bugify/screens/profile/profile.screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import './screens/login/login.screen.dart';
import './screens/home/home.screen.dart';
import './screens/splash/splash.screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final AuthProvider authProvider = AuthProvider();

  void init() {
    this.tokenListener();
  }

  void tokenListener() {
    this.authProvider.getToken().listen((token) {
      this.setAuthenticationHeader(token);
    });
  }

  void setAuthenticationHeader(token) {
    Dio dio = Dio();
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions req) {
      print('req options');
      req.headers['authorization'] = 'bearer $token';
      return req;
    }));
  }

  @override
  Widget build(BuildContext context) {
    this.init();
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        Constants.LOGIN_ROUTE: (BuildContext context) => LoginScreen(),
        Constants.HOME_ROUTE: (BuildContext context) => HomeScreen(),
        Constants.ADD_BUG: (BuildContext context) => AddBugScreen(),
        Constants.BUG_DETAIL: (BuildContext context) => BugDetailScreen(),
        Constants.PROFILE: (BuildContext context) => ProfileScreen()
      },
      theme: ThemeData(
          fontFamily: 'OpenSansCondensed',
          primaryColor: ThemeConfig.primaryColor,
          secondaryHeaderColor: ThemeConfig.primaryColor,
          accentColor: Colors.red,
          textTheme: TextTheme(
            body1: TextStyle(fontSize: 20, color: ThemeConfig.primaryColor),
            body2: TextStyle(
                fontSize: 30,
                color: ThemeConfig.primaryColor,
                fontWeight: FontWeight.normal),
            title: TextStyle(
                fontSize: 50,
                color: ThemeConfig.primaryColor,
                fontWeight: FontWeight.normal),
          ),
          appBarTheme: AppBarTheme(
              textTheme: TextTheme(
            title: TextStyle(
                fontSize: 36.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold),
            body1: TextStyle(fontSize: 114.0),
          )),
          backgroundColor: Colors.blue),
      home: SplashScreen(),
    );
  }
}
