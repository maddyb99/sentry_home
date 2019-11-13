import 'package:flutter/material.dart';
import 'package:sentry_home/Authentication/LoginPage.dart';

class Authentication extends StatefulWidget{
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sentry home"),),
      body: LoginPage(),
    );
  }
}