import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techhr/styles/styles.dart';
import 'package:techhr/view/screens/dashboard/home.dart';
import 'package:techhr/view/screens/forgotpassword.dart';
import 'package:techhr/view/screens/l.dart';
import 'package:techhr/view/screens/login.dart';
import 'package:http/http.dart' as http;

class LoginWithCompanyID extends StatefulWidget {
  @override
  _LoginWithCompanyID createState() => _LoginWithCompanyID();
}

class _LoginWithCompanyID extends State<LoginWithCompanyID> {
  GlobalKey<FormState> _key = GlobalKey();

  bool _validatec = false;
  FocusNode companyfocusnode;
  TextEditingController companyController = TextEditingController();

  String companyid = '';
  double wt, ht;
  String cerror = '';
  TextStyle ts =
      TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w500);
  @override
  void initState() {
    super.initState();

    companyfocusnode = FocusNode();
  }

  @override
  void dispose() {
    companyfocusnode.dispose();
    companyController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    wt = screenSize.width;
    ht = screenSize.height;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TECH-HR',
        color: materialColor,
        home: Scaffold(
            //  resizeToAvoidBottomPadding: false,
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
                        height: ht / 2,
                      ),
                      WavyHeader(),
                    ],
                  ),
                  _buildTitle(),
                  _showPage(),
                ],
              ),
            )));
  }

  Widget _buildTitle() {
    return Container(
        alignment: Alignment.center,
        width: wt,
        padding: EdgeInsets.all(10.0),
        child:
            Text("Login", style: onboardingtitle.copyWith(fontSize: wt / 18)));
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
                //company id

                companyIDField(),

                Padding(
                  padding: EdgeInsets.all(6.0),
                  child: button(),
                )
              ],
            ),
          ),
        ));
  }

  Widget companyIDField() {
    return TextFormField(
      onChanged: (value) {
        companyid = value;
      },
      focusNode: companyfocusnode,
      onFieldSubmitted: (String value) {
        companyfocusnode.unfocus();
      },
      style: TextStyle(
          fontSize: wt / 25,
          color: Colors.black,
          letterSpacing: 1,
          fontWeight: FontWeight.w600),
      controller: companyController,
      keyboardType: TextInputType.emailAddress,
      cursorColor: materialColor,
      decoration: InputDecoration(
        prefixIcon:
            Icon(Icons.account_balance, color: Color(0xFF6F35A5), size: 28),
        hintText: "Company ID",
        hintStyle: TextStyle(fontSize: wt / 26, color: Colors.grey[500]),
        errorText: _validatec ? cerror : null,
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

            _validatec = false;

            if (companyid == null) {
              cerror = 'Please Enter valid company id';
              _validatec = true;
              f = 1;
            }

            if (f == 0) {
              callAPI();
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
          child: Text('Login',
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
      techhrprefs.setString('companyid', companyid);
    });
  }

  callAPI() async {
    SharedPreferences techhrprefs = await SharedPreferences.getInstance();
    String url = 'http://167.71.229.226:5000/api/v1/vcompany';
    Map data = {'company_id': companyid};
    Fluttertoast.showToast(
        msg: "Before APi call" + url,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: toastColor,
        textColor: Colors.white,
        fontSize: wt / 20);

    var response = await http.post(url,
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: data,
        encoding: Encoding.getByName("gzip"));

    var reBody = json.decode(response.body)['message'];
    Fluttertoast.showToast(
        msg: "response" + reBody.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: toastColor,
        textColor: Colors.white,
        fontSize: wt / 20);

    print(reBody);
    techhrprefs.setString('cmpDtSrc', reBody['cmpDtSrc']);
    techhrprefs.setString('company_id', reBody['company_id']);
    techhrprefs.setString('company_logo', reBody['company_logo']);
    techhrprefs.setString('company_name', reBody['company_name']);
    techhrprefs.setString('creditLeaveBased', reBody['creditLeaveBased']);

    techhrprefs.setString(
        'current_payroll_month', reBody['current_payroll_month']);

    techhrprefs.setString('role', reBody['role']);
  }
}

const List<Color> orangeGradients = [
  Color(0xFF6F35A5),
  Color(0xFF6F35A5),
  Color(0xFF6F35A5),
  Color(0xFF6F35A5),
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
        height: MediaQuery.of(context).size.height / 1.7,
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
