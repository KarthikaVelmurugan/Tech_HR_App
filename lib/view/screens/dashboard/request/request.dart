import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Request extends StatefulWidget {
  @override
  _Request createState() => _Request();
}

class _Request extends State<Request> {
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
