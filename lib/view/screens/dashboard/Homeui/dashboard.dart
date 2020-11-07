import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techhr/styles/styles.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoard createState() => _DashBoard();
}

class _DashBoard extends State<DashBoard> {
  bool _visible = true;
  double ht, wt;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    wt = screenSize.width;
    ht = screenSize.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(
              padding: EdgeInsets.all(3),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Hello Antony !!",
                        style: hst.copyWith(fontSize: wt / 20),
                      ),
                    ),
                    SizedBox(height: 4),
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: Text("Welcome to BASS INFRATEL PRIVATE LIMITED",
                            style: lst.copyWith(fontSize: wt / 28)))
                  ])),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: _card(
                      "Net Salary",
                      Icon(FontAwesomeIcons.rupeeSign,
                          size: 20, color: materialColor))),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: _card(
                      "Gross",
                      Icon(FontAwesomeIcons.rupeeSign,
                          size: 20, color: materialColor))),
            ],
          ),
          Padding(padding: EdgeInsets.all(8.0), child: _infoCard())
        ])));
  }

  _infoCard() {
    return Container(
      height: ht / 3,
      padding: EdgeInsets.all(5.0),
      color: Colors.grey[50],
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            InkWell(
                onTap: () {
                  setState(() {
                    _visible = !_visible;
                  });
                },
                child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      "BirthDays",
                      style: TextStyle(
                        fontSize: wt / 27,
                        color: _visible ? materialColor : Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ))),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: _divider(),
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    _visible = !_visible;
                  });
                },
                child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      "Anniversary",
                      style: TextStyle(
                        fontSize: wt / 27,
                        color: !_visible ? materialColor : Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    )))
          ])
        ],
      ),
    );
  }

  _divider() {
    return Container(width: 1, height: 3, color: Colors.grey[100]);
  }

  _card(String st, Icon icon) {
    return Container(
        width: wt / 3.5,
        height: ht / 5,
        child: Card(
          shadowColor: materialColor,
          elevation: 15,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(4),
                    child: Center(
                        child: Text(st,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: wt / 30,
                                fontWeight: FontWeight.bold)))),
                Padding(
                  padding: EdgeInsets.all(2),
                  child: Row(children: <Widget>[
                    icon,
                    Text("25,000",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: wt / 25,
                            color: materialColor)),
                  ]),
                ),
              ]),
        ));
  }
}
