import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techhr/styles/styles.dart';
import 'package:techhr/view/screens/changepassword.dart';
import 'package:techhr/view/screens/dashboard/home.dart';
import 'package:techhr/view/screens/onboardingscreen/onboardbg.dart';

// ignore: must_be_immutable
class OtpScreen extends StatefulWidget {
  bool _isInit = true;
  var _contact = '';

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String phoneNo;
  String smsOTP;
  String verificationId;
  String errorMessage = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Timer _timer;
  double ht, wt;

  //this is method is used to initialize data
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Load data only once after screen load
    if (widget._isInit) {
      widget._contact =
          '${ModalRoute.of(context).settings.arguments as String}';
      generateOtp(widget._contact);
      widget._isInit = false;
    }
  }

  //dispose controllers
  @override
  void dispose() {
    super.dispose();
  }

  //build method for UI
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: wt * 0.025),
                              child: PinEntryTextField(
                                fields: 6,
                                //   showFieldAsBox: true,

                                onSubmit: (text) {
                                  smsOTP = text as String;
                                },
                              ),
                            ),
                            SizedBox(
                              height: wt * 0.04,
                            ),
                            GestureDetector(
                              onTap: () {
                                verifyOtp();
                              },
                              child: Container(
                                margin: const EdgeInsets.all(8),
                                height: 45,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color:
                                      materialColor, //const Color.fromARGB(255, 253, 188, 51),
                                  borderRadius: BorderRadius.circular(36),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Verify',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ))));
  }

  Widget _buildContent() {
    return Text(
      'Enter 6 digit number that was sent to ' + widget._contact,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: wt / 22,
        color: Colors.grey[500],
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
        alignment: Alignment.center,
        width: wt,
        padding: EdgeInsets.all(10.0),
        child: Text("Verification",
            style: onboardingtitle.copyWith(fontSize: wt / 18)));
  }

  storeData() async {
    SharedPreferences techhrprefs = await SharedPreferences.getInstance();
    setState(() {
      techhrprefs.setString('contact', widget._contact);
    });
  }

  //Method for generate otp from firebase
  Future<void> generateOtp(String contact) async {
    print("in generate otp" + contact);
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      verificationId = verId;
    };
    // print("Phonecodesent" + smsOTP);
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: contact,
          codeAutoRetrievalTimeout: (String verId) {
            verificationId = verId;
            print("verification id");
            print(verificationId);
          },
          codeSent: smsOTPSent,
          timeout: const Duration(seconds: 60),
          verificationCompleted: (AuthCredential phoneAuthCredential) {},
          verificationFailed: (AuthException exception) {
            // Navigator.pop(context, exception.message);
            print("Verification failed");
          });
      print(verificationId);
      print(smsOTP);
    } catch (e) {
      handleError(e as PlatformException);
      print("Errorr.....");
      // Navigator.pop(context, (e as PlatformException).message);
    }
  }

  //Method for verify otp entered by user
  Future<void> verifyOtp() async {
    print("Sma Otp is ..." + smsOTP);
    if (smsOTP == null || smsOTP == '') {
      showAlertDialog(context, 'please enter 6 digit otp');
      return;
    }
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId,
        smsCode: smsOTP,
      );
      final AuthResult user = await _auth.signInWithCredential(credential);
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.user.uid == currentUser.uid);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => ChangePassWord()));
    } catch (e) {
      handleError(e as PlatformException);
    }
  }

  //Method for handle the errors
  void handleError(PlatformException error) {
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(FocusNode());
        setState(() {
          errorMessage = 'Invalid Code';
        });
        showAlertDialog(context, 'Invalid Code');
        break;
      default:
        showAlertDialog(context, error.message);
        break;
    }
  }

  //Basic alert dialogue for alert errors and confirmations
  void showAlertDialog(BuildContext context, String message) {
    // set up the AlertDialog
    final CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: const Text('Error'),
      content: Text('\n$message'),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('Ok'),
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
