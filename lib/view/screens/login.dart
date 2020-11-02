import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techhr/view/screens/backgroundlogin.dart';

import 'package:techhr/view/screens/onboardingscreen/onboardbg.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "TECH-HR",
        home: Scaffold(body: Stack(children: <Widget>[BackgroundLogin()])));
  }
}
