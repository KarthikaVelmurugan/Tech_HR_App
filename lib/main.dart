import 'package:flutter/material.dart';
import 'package:techhr/styles/styles.dart';
import 'package:techhr/view/screens/dashboard/home.dart';
import 'package:techhr/view/screens/dashboard/profile/profileui.dart';
import 'package:techhr/view/screens/onboardingscreen/onboardingui.dart';
import 'package:techhr/view/screens/otpauth.dart';
import 'package:techhr/view/screens/splashscreen.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TECH-HR',
      color: materialColor,
      home: new SplashScreen(), // redirect to splashscreen
      routes: <String, WidgetBuilder>{
        '/otpScreen': (BuildContext context) => OtpScreen(),
        // '/homeScreen': (BuildContext ctx) => HomeScreen(),
        //   '/LoginPage': (BuildContext context) => new Login(),
        '/HomePage': (BuildContext context) =>
            new Home(), //Redirect to homepage
        '/WelcomePage': (BuildContext context) =>
            new OnboardingScreen(), //Redirect to loginpage
      },
    );
  }
}
