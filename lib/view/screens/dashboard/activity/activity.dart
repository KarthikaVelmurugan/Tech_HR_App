import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  @override
  _Activity createState() => _Activity();
}

class _Activity extends State<Activity> {
  double ht, wt;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    wt = screenSize.width;
    ht = screenSize.height;

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Text("Home"));
  }
}
