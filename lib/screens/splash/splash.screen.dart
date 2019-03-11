import 'dart:async';

import 'package:bugify/auth.provider.dart';
import 'package:bugify/config/constants.dart';
import 'package:bugify/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  final Widget child;

  SplashScreen({Key key, this.child}) : super(key: key);

  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthProvider authProvider = AuthProvider();

  void initState() {
    super.initState();
    this.getSharedPreferences().then((sharedPreferences) {
      String token = sharedPreferences.getString(Constants.TOKEN_REF);
      bool hasToken = token != null;
      this.authProvider.setToken(token);
      Timer(
          Duration(seconds: 3),
          () => Navigator.pushReplacementNamed(
              context, hasToken ? Constants.HOME_ROUTE : Constants.LOGIN_ROUTE));
    });
  }

  Future<SharedPreferences> getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeConfig.primaryColor,
    );
  }
}
