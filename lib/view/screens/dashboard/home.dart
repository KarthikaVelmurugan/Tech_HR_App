import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techhr/styles/styles.dart';
import 'package:techhr/view/screens/dashboard/Homeui/homepage.dart';
import 'package:techhr/view/screens/dashboard/activity/activity.dart';
import 'package:techhr/view/screens/dashboard/profile/profileui.dart';
import 'package:techhr/view/screens/dashboard/request/request.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  double height, width;
  bool _isselected = false;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _isselected = true;
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    final List<Widget> _widgetOptions = <Widget>[
      HomePage(),
      // SideBarLayout(),
      Request(),
      Activity(),
      Profile(),
    ];

    return WillPopScope(
        onWillPop: _onBackPressed,
        child: MaterialApp(
          title: 'TECH - HR',
          color: materialColor,
          debugShowCheckedModeBanner: false,
          //  theme: ThemeData(fontFamily: 'Poppins'),
          home: Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
              height: 55,
              // showSelectedLabels: true,

              backgroundColor: Colors.white, // Color.fromRGBO(0, 74, 173, 1),
              color: materialColor,

              buttonBackgroundColor: Colors.white,
              animationDuration: Duration(milliseconds: 30),
              items: <Widget>[
                Icon(Icons.home, color: Colors.black, size: 28),
                Icon(FontAwesomeIcons.plane, size: 24),
                Icon(
                  FontAwesomeIcons.solidBell,
                  size: 24,
                ),
                Icon(Icons.person, size: 28)
              ],

              onTap: _onItemTapped,
            ),
            backgroundColor: Colors.white,
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
        ));
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            elevation: 5,
            contentPadding: EdgeInsets.all(20),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: 16),
              new GestureDetector(
                onTap: () =>
                    SystemNavigator.pop(), //Navigator.of(context).pop(true),
                child: Text("YES"),
              ),
              SizedBox(width: 16),
            ],
          ),
        ) ??
        false;
  }
}
