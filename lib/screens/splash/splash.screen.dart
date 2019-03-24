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

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AuthProvider authProvider = AuthProvider();
  Animation<double> animation;
  Animation<Color> animationColor;
  AnimationController controller;

  void initState() {
    super.initState();
    this.initAnimation();
    this.getTokenAndNavigate();
  }

  void initAnimation() {
    this.controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    this.animation = Tween<double>(begin: 100, end: 390)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0.9, 1)));
    this.animationColor = ColorTween(begin: ThemeConfig.primaryColor, end:  Colors.white).animate(CurvedAnimation(parent: controller, curve: Interval(0.97, 1)));
  }

  void getTokenAndNavigate() {
    this.getSharedPreferences().then((sharedPreferences) {
      String token = sharedPreferences.getString(Constants.TOKEN_REF);
      bool hasToken = token != null;
      this.authProvider.setToken(token);
      this.controller.forward();
      Timer(
          Duration(milliseconds: 3001),
          () {
            Navigator.pushReplacementNamed(context, hasToken ? Constants.HOME_ROUTE : Constants.LOGIN_ROUTE);
            this.controller.dispose();
          });
    });
  }

  Future<SharedPreferences> getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeConfig.primaryColor,
      child: Center(
        child: GrowTransition(child: Logo(), animationController: controller, animation: animation, animationColor: animationColor),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class Logo extends StatelessWidget {
  final double size;
  final Color bgColor;

  Logo({this.size, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.bgColor,
      child: Icon(
        Icons.bug_report,
        color: Colors.white,
        size: this.size,
      ),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animationController, this.animation, this.animationColor});

  final Logo child;
  final AnimationController animationController;
  final Animation<double> animation;
  final Animation<Color> animationColor;

  Widget build(BuildContext context) => Center(
        child: AnimatedBuilder(
            animation: animationController,
            builder: (context, child) => Container(
                  height: animation.value,
                  width: animation.value,
                  child: Logo(size: animation.value, bgColor: animationColor.value),
                ),
            child: Logo()),
      );
}
