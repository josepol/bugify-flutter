import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {

  ProfileScreen();

  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        child: Center(
          child: Text('data'),
        ),
      ),
    );
  }
}