import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techhr/styles/styles.dart';
import 'package:techhr/view/screens/dashboard/Homeui/myteamdetails/attendance.dart';
import 'package:techhr/view/screens/dashboard/Homeui/myteamdetails/leaverequest.dart';
import 'package:techhr/view/screens/dashboard/Homeui/myteamdetails/teammembers.dart';

class MyTeam extends StatefulWidget {
  @override
  _MyTeam createState() => _MyTeam();
}

class _MyTeam extends State<MyTeam> {
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
                height: wt / 1.2,
                child: Image.asset('assets/images/myteam.jpeg', width: wt)),
            SizedBox(height: 10),
            Center(
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "View Team Info",
                    style: hst.copyWith(fontSize: wt / 22),
                  )),
            ),
            Container(
              padding: EdgeInsets.all(6.0),
              child: Text("Tap to view your Team members info",
                  style: lst.copyWith(fontSize: wt / 26)),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: <Widget>[
                  _cardTeam(
                      'My Team',
                      Icon(FontAwesomeIcons.userFriends,
                          size: 28, color: materialColor),
                      1),
                  _cardTeam(
                      'Team Leave \n Requests',
                      Icon(FontAwesomeIcons.solidCalendar,
                          size: 28, color: materialColor),
                      2),
                  _cardTeam(
                      'Attendance \n Regularizations',
                      Icon(FontAwesomeIcons.solidClock,
                          size: 28, color: materialColor),
                      3),
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
              MaterialPageRoute(builder: (context) => Members()),
            );
          } else if (i == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Leave()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Attendance()),
            );
          }
        });
      },
    );
  }
}
