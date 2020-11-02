import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoard createState() => _DashBoard();
}

class _DashBoard extends State<DashBoard> {
  double ht, wt;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    wt = screenSize.width;
    ht = screenSize.height;

    return Scaffold(backgroundColor: Colors.white, body: Text("Dashboards"));
  }
}
