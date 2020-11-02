import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techhr/styles/styles.dart';
import 'package:techhr/view/screens/l.dart';
import 'package:techhr/view/screens/login.dart';
import 'package:techhr/view/screens/onboardingscreen/onboardbg.dart';

class ProfileChangePassWord extends StatefulWidget {
  @override
  _ProfileChangePassWord createState() => _ProfileChangePassWord();
}

class _ProfileChangePassWord extends State<ProfileChangePassWord> {
  GlobalKey<FormState> _key = GlobalKey();
  bool _validater = false;
  bool _validatep = false;
  bool _validatecon = false;

  FocusNode pwdfocusnode, cpwdfocusnode, refocusnode;
  TextEditingController pwdController = TextEditingController();
  TextEditingController cpwdController = TextEditingController();
  TextEditingController reController = TextEditingController();

  Color left = Colors.black;
  Color right = Colors.white;
  String pwd, cpwd, rpwd;
  double wt, ht;
  TextStyle ts =
      TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w500);
  @override
  void initState() {
    super.initState();
    pwdfocusnode = FocusNode();
    cpwdfocusnode = FocusNode();
    refocusnode = FocusNode();
    //  firebaseCloudMessaging();
  }

  @override
  void dispose() {
    pwdfocusnode.dispose();
    cpwdfocusnode.dispose();
    refocusnode.dispose();
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
            child: Background(
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
              _showPage(),
              _showBackButton(),
            ],
          ),
        )));
  }

  Widget _showBackButton() {
    return InkWell(
        onTap: () {
          //back
          Navigator.pop(context);
        },
        child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //    Image.asset("assets/images/arrowl.png", height: 20, width: 20),
                Icon(FontAwesomeIcons.angleLeft, size: 28, color: Colors.black),
                SizedBox(width: 10),
                Text("Back",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: wt / 24,
                    ))
              ],
            )));
  }

  Widget _buildTitle() {
    return Container(
        alignment: Alignment.center,
        width: wt,
        padding: EdgeInsets.all(10.0),
        child: Text("Change Password", style: ts.copyWith(fontSize: wt / 18)));
  }

  Widget _showPage() {
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
                //password

                passwordField(),
                //confirm passsword

                confirmpasswordField(),
                //retype password
                retypepasswordfield(),

                Padding(
                  padding: EdgeInsets.all(6.0),
                  child: changebutton(),
                )
              ],
            ),
          ),
        ));
  }

  Widget passwordField() {
    return TextFormField(
      onChanged: (value) {
        pwd = value;
      },
      focusNode: pwdfocusnode,
      onFieldSubmitted: (String value) {
        pwdfocusnode.unfocus();
        cpwdfocusnode.requestFocus();
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

  Widget confirmpasswordField() {
    return TextFormField(
      onChanged: (value) {
        cpwd = value;
      },
      focusNode: cpwdfocusnode,
      onFieldSubmitted: (String value) {
        cpwdfocusnode.unfocus();
        refocusnode.requestFocus();
      },
      style: TextStyle(
          fontSize: wt / 25,
          color: Colors.black,
          letterSpacing: 1,
          fontWeight: FontWeight.w600),
      controller: cpwdController,
      keyboardType: TextInputType.text,
      cursorColor: Color(0xFF6F35A5),
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock, color: Color(0xFF6F35A5), size: 28),
        hintText: "Confirm Password",
        hintStyle: TextStyle(fontSize: wt / 26, color: Colors.grey[500]),
        errorText: _validatecon ? 'Invalid Confirm Password' : null,
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

  Widget retypepasswordfield() {
    return TextFormField(
      onChanged: (value) {
        rpwd = value;
      },
      focusNode: refocusnode,
      onFieldSubmitted: (String value) {
        refocusnode.unfocus();
      },
      style: TextStyle(
          fontSize: wt / 25,
          color: Colors.black,
          letterSpacing: 1,
          fontWeight: FontWeight.w600),
      controller: reController,
      keyboardType: TextInputType.text,
      cursorColor: Color(0xFF6F35A5),
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock, color: Color(0xFF6F35A5), size: 28),
        hintText: "Retype Password",
        hintStyle: TextStyle(fontSize: wt / 26, color: Colors.grey[500]),
        errorText: _validater ? 'Invalid Password' : null,
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

  Widget changebutton() {
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
            _validatep = false;
            _validatecon = false;

            if (pwd != cpwd) {
              _validatecon = true;

              f = 1;
            }
            if (pwd == null) {
              _validatep = true;

              f = 1;
            }
            if (cpwd == null) {
              _validatecon = true;
              f = 1;
            }
            if (rpwd == null) {
              _validater = true;
              f = 1;
            }

            if (f == 0) {
              // toast(context, "Your $name and Mobile $mobno saved!");
              storeData();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            }
          });
        },
        color: materialColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
          child: Text('Change Password',
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
      techhrprefs.setString('password', pwd);
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

class WavyFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: FooterWaveClipper(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: aquaGradients,
              begin: Alignment.center,
              end: Alignment.bottomRight),
        ),
        height: MediaQuery.of(context).size.height / 1.5,
      ),
    );
  }
}

class CirclePink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(-70.0, 90.0),
      child: Material(
        color: Colors.pink,
        child: Padding(padding: EdgeInsets.all(120)),
        shape: CircleBorder(side: BorderSide(color: Colors.white, width: 15.0)),
      ),
    );
  }
}

class CircleYellow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, 210.0),
      child: Material(
        color: Colors.yellow,
        child: Padding(padding: EdgeInsets.all(140)),
        shape: CircleBorder(side: BorderSide(color: Colors.white, width: 15.0)),
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

class FooterWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height - 60);
    var secondControlPoint = Offset(size.width - (size.width / 6), size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class YellowCircleClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return null;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
