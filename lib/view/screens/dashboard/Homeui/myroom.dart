import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techhr/styles/styles.dart';
import 'package:techhr/view/screens/dashboard/Homeui/myroomdetails/emp_attendance.dart';
import 'package:techhr/view/screens/dashboard/Homeui/myroomdetails/emp_compensation.dart';
import 'package:techhr/view/screens/dashboard/Homeui/myroomdetails/emp_leaverequest.dart';
import 'package:techhr/view/screens/dashboard/Homeui/myroomdetails/emp_raisenoticeperiod.dart';
import 'package:techhr/view/screens/dashboard/Homeui/myroomdetails/emp_regularization.dart';
import 'package:techhr/view/screens/dashboard/Homeui/myroomdetails/emp_taxplanner.dart';

class MyRoom extends StatefulWidget {
  @override
  _MyRoom createState() => _MyRoom();
}

class _MyRoom extends State<MyRoom> {
  double ht, wt;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    wt = screenSize.width;
    ht = screenSize.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Container(
                height: wt / 2,
                child: Image.asset('assets/images/myteam.jpeg', width: wt)),
            SizedBox(height: 10),
            Center(
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Employee Info",
                    style: hst.copyWith(fontSize: wt / 22),
                  )),
            ),
            Container(
              padding: EdgeInsets.all(6.0),
              child: Text("Tap to view your Room info",
                  style: lst.copyWith(fontSize: wt / 26)),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(children: <Widget>[
                  Row(children: <Widget>[
                    _cardTeam(
                        'Attendance',
                        Icon(FontAwesomeIcons.solidStickyNote,
                            size: 28, color: materialColor),
                        1),
                    _cardTeam(
                        'Tax Planner',
                        Icon(FontAwesomeIcons.rupeeSign,
                            size: 28, color: materialColor),
                        2),
                    _cardTeam(
                        'Regularizations',
                        Icon(FontAwesomeIcons.solidClock,
                            size: 28, color: materialColor),
                        3),
                  ]),
                  Row(children: <Widget>[
                    _cardTeam(
                        'Leave \n Requests',
                        Icon(FontAwesomeIcons.solidCalendar,
                            size: 28, color: materialColor),
                        4),
                    _cardTeam(
                        'Compensation',
                        Icon(FontAwesomeIcons.solidThumbsUp,
                            size: 28, color: materialColor),
                        5),
                    _cardTeam(
                        'Raise a \n notice\n period',
                        Icon(FontAwesomeIcons.solidBell,
                            size: 28, color: materialColor),
                        6),
                  ])
                ]))
          ],
        ));
  }

  _cardTeam(String st, Icon icon, int i) {
    return InkWell(
      child: Container(
          width: wt / 3.5,
          height: ht / 5,
          child: Card(
            shadowColor: materialColor,
            elevation: 15,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(2),
                      child: Column(
                        children: <Widget>[icon],
                      )),
                  Padding(
                      padding: EdgeInsets.all(4),
                      child: Center(
                          child: Text(st,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: wt / 35,
                                  fontWeight: FontWeight.w600)))),
                ]),
          )),
      onTap: () {
        setState(() {
          if (i == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Emp_Attendance()),
            );
          } else if (i == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Emp_Tax()),
            );
          } else if (i == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Emp_Regularization()),
            );
          } else if (i == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EmpLeave()),
            );
          } else if (i == 5) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Emp_Compensation()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Emp_Notice()),
            );
          }
        });
      },
    );
  }
}
