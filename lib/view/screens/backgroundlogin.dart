import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techhr/styles/styles.dart';
import 'package:techhr/view/screens/dashboard/home.dart';
import 'package:techhr/view/screens/forgotpassword.dart';
import 'package:techhr/view/screens/l.dart';

class BackgroundLogin extends StatefulWidget {
  @override
  _Background createState() => _Background();
}

class _Background extends State<BackgroundLogin> {
  GlobalKey<FormState> _key = GlobalKey();
  bool _validateu = false;
  bool _validatep = false;
  FocusNode userfocusnode, pwdfocusnode;
  TextEditingController userController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  bool _selectTab = false;
  Color left = Colors.black;
  Color right = Colors.white;
  String pass, name, user;
  double wt, ht;
  TextStyle ts =
      TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w500);
  @override
  void initState() {
    super.initState();
    userfocusnode = FocusNode();
    pwdfocusnode = FocusNode();
    //  firebaseCloudMessaging();
  }

  @override
  void dispose() {
    userfocusnode.dispose();
    pwdfocusnode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    wt = screenSize.width;
    ht = screenSize.height;

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              new Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Image.asset(
                    'assets/images/ui.jpeg',
                    width: MediaQuery.of(context).size.width / 1.6,
                    height: ht / 4,
                  ),
                  WavyHeader(),
                ],
              ),
              _buildTitle(),
              _buildTeam(),
            ],
          ),
        ));
  }

  Widget _buildTeam() {
    return Container(
        width: wt,
        // color: Colors.blueGrey.shade50,
        child: Column(
          children: <Widget>[
            Container(
                height: wt / 4.5,
                width: wt / 1.3,
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(249, 243, 249, 1.0),
                          borderRadius: BorderRadius.circular(20)),
                      height: wt / 4.5,
                      width: wt / 1.3,
                      // width: wt / 4,
                      child: Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              //calender  tab select
                              setState(() {
                                _selectTab = !_selectTab;
                              });
                            },
                            child: Container(
                                height: wt / 4.5,
                                width: wt / 3,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: !_selectTab
                                        ? materialColor
                                        : Color.fromRGBO(249, 243, 249, 1.0),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                    padding: EdgeInsets.all(6.0),
                                    child: Text("Admin",
                                        style: TextStyle(
                                            fontSize: wt / 24,
                                            color: !_selectTab
                                                ? Colors.white
                                                : Colors.grey[400],
                                            fontWeight: FontWeight.bold)))),
                          ),
                          InkWell(
                            onTap: () {
                              //menu  tab select
                              setState(() {
                                _selectTab = !_selectTab;
                              });
                            },
                            child: Container(
                              height: wt / 4.5,
                              width: wt / 3,
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Text("Employee",
                                      style: TextStyle(
                                          fontSize: wt / 24,
                                          color: _selectTab
                                              ? Colors.white
                                              : Colors.grey[400],
                                          fontWeight: FontWeight.bold))),
                              decoration: BoxDecoration(
                                  color: _selectTab
                                      ? materialColor
                                      : Color.fromRGBO(249, 243, 249, 1.0),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ],
                      ),
                    ))),
            Container(
              height: 5,
            ),
            !_selectTab ? _showPage(1) : _showPage(2),
            _showForgetPassword(),
          ],
        ));
  }

  Widget _showForgetPassword() {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: InkWell(
          onTap: () {
            // Navigator.of(context).pushReplacementNamed('/forgotpassword');
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ForgotPassWord()));
          },
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 4,
                  width: wt / 8,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(15)),
                ),
                SizedBox(
                  width: 15,
                ),
                Text("FORGOT PASSWORD",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: wt / 28,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 4,
                  width: wt / 8,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(15)),
                ),
              ])),
    );
  }

  Widget _buildTitle() {
    return Container(
        alignment: Alignment.center,
        width: wt,
        padding: EdgeInsets.all(10.0),
        child: Text("Sign in",
            style: onboardingtitle.copyWith(fontSize: wt / 18)));
  }

  Widget _showPage(int i) {
    return Container(
        padding: EdgeInsets.all(25.0),
        //  margin: EdgeInsets.all(1.0),
        child: Card(
          key: _key,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          elevation: 10,
          shadowColor: materialColor,
          child: Container(
            padding: EdgeInsets.all(7.0),
            child: Column(
              children: <Widget>[
                //name
                userIDField(),
                //mobile
                pwdTextFormField(),

                Padding(
                  padding: EdgeInsets.all(6.0),
                  child: button(),
                )
              ],
            ),
          ),
        ));
  }

  Widget userIDField() {
    return TextFormField(
      onChanged: (value) {
        user = value;
      },
      focusNode: userfocusnode,
      onFieldSubmitted: (String value) {
        userfocusnode.unfocus();
        pwdfocusnode.requestFocus();
      },
      style: TextStyle(
          fontSize: wt / 25,
          color: Colors.black,
          letterSpacing: 1,
          fontWeight: FontWeight.w600),
      controller: userController,
      keyboardType: TextInputType.text,
      cursorColor: materialColor,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person, color: Color(0xFF6F35A5), size: 28),
        hintText: "User ID",
        hintStyle: TextStyle(fontSize: wt / 26, color: Colors.grey[500]),
        errorText: _validateu ? 'UserID shoud be in correct format' : null,
        errorStyle: TextStyle(
          fontSize: wt / 28,
          color: Colors.deepPurple,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none),
      ),
    );
  }

  Widget pwdTextFormField() {
    return TextFormField(
      onChanged: (value) {
        pass = value;
      },
      focusNode: pwdfocusnode,
      onFieldSubmitted: (String value) {
        pwdfocusnode.unfocus();
        //  mobilefocusnode.requestFocus();
      },
      style: TextStyle(
          fontSize: wt / 25,
          color: Colors.black,
          letterSpacing: 1,
          fontWeight: FontWeight.w600),
      controller: pwdController,
      keyboardType: TextInputType.text,
      cursorColor: Color(0xFF6F35A5),
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock, color: Color(0xFF6F35A5), size: 28),
        hintText: "Password",
        hintStyle: TextStyle(fontSize: wt / 26, color: Colors.grey[500]),
        errorText: _validatep ? 'Invalid Password' : null,
        errorStyle: TextStyle(
          fontSize: wt / 28,
          color: Colors.deepPurple,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none),
      ),
    );
  }

  Widget button() {
    return RaisedButton(
        onPressed: () async {
          /*  _locationData = await location.getLocation();
            print(_locationData.latitude);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('latitude', _locationData.latitude.toString());
            prefs.setString('longitude', _locationData.longitude.toString());
            */

          setState(() {
            var f = 0;
            _validateu = false;
            _validatep = false;

            /*  if (email == null || email == '' || !email.contains('@gmail.com')) {
              _validatee = true;

              f = 1;
            }*/
            if (user == null) {
              _validateu = true;
              f = 1;
            }
            if (pass == null || (pass.length < 6)) {
              _validatep = true;

              f = 1;
            }

            if (f == 0) {
              // toast(context, "Your $name and Mobile $mobno saved!");
              storeData();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            }
          });
        },
        color: materialColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
          child: Text('Signin',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: wt / 28,
                  fontWeight: FontWeight.w600)),
        ),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
        ));
  }

  storeData() async {
    SharedPreferences techhrprefs = await SharedPreferences.getInstance();
    setState(() {
      techhrprefs.setBool('first_time', false);
      print("bool value changed");
      techhrprefs.setString('userid', user);
      techhrprefs.setString('password', pass);
    });
  }
}

const List<Color> orangeGradients = [
  Color(0xFF6F35A5),
  Color(0xFF6F35A5),
  Color(0xFF6F35A5),
  Color(0xFF6F35A5),
];

const List<Color> aquaGradients = [
  Color(0xFF5AEAF1),
  Color(0xFF8EF7DA),
];

class WavyHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TopWaveClipper(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: orangeGradients,
              begin: Alignment.topLeft,
              end: Alignment.center),
        ),
        height: MediaQuery.of(context).size.height / 2.5,
      ),
    );
  }
}

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // This is where we decide what part of our image is going to be visible.
    var path = Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = new Offset(size.width / 7, size.height - 30);
    var firstEndPoint = new Offset(size.width / 6, size.height / 1.5);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width / 5, size.height / 4);
    var secondEndPoint = Offset(size.width / 1.5, size.height / 5);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint =
        Offset(size.width - (size.width / 9), size.height / 6);
    var thirdEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    ///move from bottom right to top
    path.lineTo(size.width, 0.0);

    ///finally close the path by reaching start point from top right corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
