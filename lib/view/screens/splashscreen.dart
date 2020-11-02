import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techhr/styles/styles.dart';
import 'package:techhr/view/screens/backgroundsplash.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
//Initialize startTime() for predict duration limit.
  startTime() async {
    SharedPreferences techhrprefs = await SharedPreferences.getInstance();
    //  techhrprefs.clear();

    bool firstTime = techhrprefs.getBool('first_time');

    var _duration = new Duration(seconds: 1);
    if (firstTime != null && !firstTime) {
      // Not first time
      return new Timer(_duration, navigationPageHome);
    } else {
      // First time

      return new Timer(_duration, navigationPageOnBoarding);
    }
  }

  void navigationPageHome() {
    //Navigate to Homepage(not first time)
    Navigator.of(context).pushReplacementNamed('/HomePage');
  }

  void navigationPageOnBoarding() {
    //Navigate to LoginPage (first time)
    Navigator.of(context).pushReplacementNamed('/WelcomePage');
  }

  @override
  void initState() {
    super.initState();

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double wt = screenSize.width;
    TextStyle ts = TextStyle(
      fontSize: wt / 15,
      color: Colors.white,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic,
      letterSpacing: 1,
    );
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //  Background(
          Container(
            color: Color(0xFF6F35A5),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'TECH - HR',
                    style: ts,
                  ),
                  /* Text(
                    'Partner',
                    style: ts,
                  ),*/
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
