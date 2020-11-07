import 'package:avatar_glow/avatar_glow.dart';
import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techhr/styles/styles.dart';
import 'package:techhr/view/screens/changepassword.dart';
import 'package:techhr/view/screens/dashboard/Homeui/dashboard.dart';
import 'package:techhr/view/screens/dashboard/Homeui/myroom.dart';
import 'package:techhr/view/screens/dashboard/Homeui/myteam.dart';
import 'package:techhr/view/screens/dashboard/Homeui/payslips.dart';
import 'package:techhr/view/screens/dashboard/profile/profileui.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> with SingleTickerProviderStateMixin {
  double ht, wt;
  FancyDrawerController _controller;
  String url = "";
  bool _isselected = false;
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    DashBoard(),
    MyRoom(),
    MyTeam(),
    PaySlips()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _isselected = true;
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = FancyDrawerController(
        vsync: this, duration: Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void handleClick(String value) {
      switch (value) {
        case 'Profile':
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) => Profile()));
          break;
        case 'Logout':
          break;
        case 'Settings':
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ChangePassWord()));

          break;
      }
    }

    Size screenSize = MediaQuery.of(context).size;
    wt = screenSize.width;
    ht = screenSize.height;

    return Material(
      child: FancyDrawerWrapper(
        cornerRadius: 15,
        //itemGap: 10,
        backgroundColor: materialColor,
        controller: _controller,
        drawerItems: <Widget>[
          //    Container(padding: EdgeInsets.all(1.0), child: _buildProfileLogo()),
          drawerItem(
              "DashBoard",
              Icon(
                Icons.home,
                size: 25,
                color: Colors.black,
              ),
              0),
          drawerItem("My Room",
              Icon(FontAwesomeIcons.cogs, size: 25, color: Colors.black), 1),
          drawerItem(
              "My Team", Icon(Icons.person, size: 25, color: Colors.black), 2),
          drawerItem(
              "PaySlips",
              Icon(FontAwesomeIcons.rupeeSign, size: 25, color: Colors.black),
              3)
        ],
        child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              /*  title: Text(
              "PaySlips",
              style: hst.copyWith(fontSize: wt / 24),
            ),*/
              backgroundColor: Colors.white,
              actions: <Widget>[
                /*CircleAvatar(
                  child: Icon(FontAwesomeIcons.solidUser,
                      size: 18, color: Colors.blueGrey[400]),
                  radius: 22,
                  backgroundColor: Colors.blueGrey[50],
                ),*/
                PopupMenuButton<String>(
                  onSelected: handleClick,
                  /*  child: CircleAvatar(
                    child: Icon(FontAwesomeIcons.solidUser,
                        size: 18, color: Colors.blueGrey[400]),
                    radius: 22,
                    backgroundColor: Colors.blueGrey[50],
                  ),*/
                  icon: Icon(
                    FontAwesomeIcons.solidUser,
                    size: 20,
                    color: Colors.blueGrey[200],
                  ),
                  itemBuilder: (BuildContext context) {
                    return {'Profile', 'Settings', 'Logout'}
                        .map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(
                          choice,
                          style: hst.copyWith(fontSize: wt / 29),
                        ),
                      );
                    }).toList();
                  },
                ),
              ],
              /* actions: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    child: Icon(FontAwesomeIcons.solidUser,
                        size: 18, color: Colors.blueGrey[400]),
                    radius: 22,
                    backgroundColor: Colors.blueGrey[50],
                  ),
                )
              ],*/
              leading: IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 28,
                  color: Colors.black,
                ),
                onPressed: () {
                  _controller.toggle();
                },
              ),
            ),
            backgroundColor: Colors.white,
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            )),
      ),
    );
  }

  Widget drawerItem(String title, Icon icon, int index) {
    return Container(
      width: wt / 2,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        onTap: () {
          _onItemTapped(index);
          _controller.close();
        },
        leading: icon, //Icon(Icons.home, color: Colors.black, size: 25),
        title: Text(title,
            style: TextStyle(
                color: Colors.black,
                fontSize: wt / 25,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5)),
      ),
    );
  }

  Widget _buildProfileLogo() {
    return AvatarGlow(
      glowColor: Colors.white,
      endRadius: 60.0,
      duration: Duration(milliseconds: 2000),
      repeat: true,
      showTwoGlows: true,
      repeatPauseDuration: Duration(milliseconds: 100),
      child: Material(
        elevation: 8.0,
        shape: CircleBorder(),
        child: CircleAvatar(
          backgroundColor: Colors.grey[100],
          child: Container(
            width: wt / 3,
            height: wt / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(
                color: materialColor,
                width: 2,
              ),
            ),
          ),
          radius: 35.0,
        ),
      ),
    );
  }
}
