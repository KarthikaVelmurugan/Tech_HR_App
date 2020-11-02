import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techhr/styles/styles.dart';
import 'package:techhr/view/screens/changepassword.dart';
import 'package:techhr/view/screens/country_picker.dart';
import 'package:techhr/view/screens/custom_button.dart';
import 'package:techhr/view/screens/l.dart';
import 'package:techhr/view/screens/onboardingscreen/onboardbg.dart';
import 'package:techhr/view/screens/otpauth.dart';

class ForgotPassWord extends StatefulWidget {
  @override
  _ForgotPassWord createState() => _ForgotPassWord();
}

class _ForgotPassWord extends State<ForgotPassWord> {
  FocusNode otpfocusnode, mobfocusnode, userfocusnode;
  TextEditingController otpController = TextEditingController();
  TextEditingController mobController = TextEditingController();
  TextEditingController userController = TextEditingController();

  Color left = Colors.black;
  Color right = Colors.white;
  String otp, mob, userid;
  double wt, ht;
  TextStyle ts =
      TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w500);
  final _contactEditingController = TextEditingController();
  var _dialCode = '';

  //Login click with contact number validation
  Future<void> clickOnLogin(BuildContext context) async {
    if (_contactEditingController.text.isEmpty) {
      showErrorDialog(context, 'Contact number can\'t be empty.');
    } else {
      final responseMessage =
          /*await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  OtpScreen(_contactEditingController.text)));*/

          Navigator.pushNamed(context, '/otpScreen',
              arguments: '$_dialCode${_contactEditingController.text}');

      // print("Response message" + responseMessage);
      if (responseMessage != null) {
        showErrorDialog(context, responseMessage as String);
      }
    }
  }

  //callback function of country picker
  void _callBackFunction(String name, String dialCode, String flag) {
    _dialCode = dialCode;
  }

  //Alert dialogue to show error and response
  void showErrorDialog(BuildContext context, String message) {
    // set up the AlertDialog
    final CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: const Text('Error'),
      content: Text('\n$message'),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('Yes'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    otpfocusnode = FocusNode();
    mobfocusnode = FocusNode();
    //  firebaseCloudMessaging();
  }

  @override
  void dispose() {
    otpfocusnode.dispose();
    mobfocusnode.dispose();
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
        routes: <String, WidgetBuilder>{
          '/otpScreen': (BuildContext context) => OtpScreen()
        },
        home: Scaffold(
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
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: _buildContent(),
                  ),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: wt > 600 ? wt * 0.2 : 16),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            // ignore: prefer_const_literals_to_create_immutables
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(16.0)),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(8),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              height: 45,
                              /*   decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 253, 188, 51),
                            ),
                            borderRadius: BorderRadius.circular(36),
                          ),*/
                              child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  CountryPicker(
                                    callBackFunction: _callBackFunction,
                                    headerText: 'Select Country',
                                    headerBackgroundColor:
                                        Theme.of(context).primaryColor,
                                    headerTextColor: Colors.white,
                                  ),
                                  SizedBox(
                                    width: wt / 10,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      cursorColor: materialColor,
                                      decoration: const InputDecoration(
                                        hintText: 'Contact Number',
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 13.5),
                                      ),
                                      controller: _contactEditingController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(10)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomButton(clickOnLogin),
                          ],
                        ),
                      ))
                  //  _showPage(),
                ],
              ),
            ))));
  }

  Widget _buildContent() {
    return Text(
      'Enter your mobile number to receive a verification code',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: wt / 24,
        color: Colors.grey[500],
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
        alignment: Alignment.center,
        width: wt,
        padding: EdgeInsets.all(10.0),
        child: Text("Forgot Password ",
            style: onboardingtitle.copyWith(fontSize: wt / 18)));
  }

  storeData() async {
    SharedPreferences techhrprefs = await SharedPreferences.getInstance();
    setState(() {
      techhrprefs.setString('otp', otp);
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
        height: MediaQuery.of(context).size.height / 2,
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
