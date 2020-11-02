import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techhr/styles/styles.dart';
import 'package:techhr/view/screens/login.dart';
import 'package:techhr/view/screens/logincompany.dart';
import 'package:techhr/view/screens/onboardingscreen/onboardbg.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  double ht, wt;
  final int _numPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: isActive ? 13.0 : 8.0,
      width: isActive ? 13.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.deepPurple[400] : Colors.grey[400],
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ht = MediaQuery.of(context).size.height;
    wt = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white70,
        body: Material(
            child: Background(
          child: Container(
            padding: EdgeInsets.all(5.0),
            height: ht,
            width: wt,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: ht / 1.2,
                  width: wt,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      buildPage(
                          'assets/images/slider1.jpeg',
                          'Welcome to Grove HR',
                          'All you need to succeed \nin one place'),
                      buildPage('assets/images/s.jpeg', 'Have a great start',
                          'Follow our onboarding steps and prepare yourself for success'),
                      buildPage('assets/images/ui.jpeg', 'Stay Productive',
                          'We made HR processes easy and simple just for you.'),
                      buildPage('assets/images/slider1.jpeg', 'Stay up to date',
                          'Receive company announcements and track your own progress.')
                    ],
                  ),
                ),
                Container(
                    height: ht / 7,
                    padding: EdgeInsets.all(6.0),
                    width: wt,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _buildPageIndicator(),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(2.0),
                            child: FlatButton(
                                onPressed: () {
                                  if (_currentPage == _numPages - 1) {
                                    //navigate to login
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginWithCompanyID()));
                                  } else {
                                    _pageController.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  }
                                },
                                child: _currentPage == _numPages - 1
                                    ? Text("Go to Login",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            //  letterSpacing: 1,
                                            fontSize: wt / 20))
                                    : Row(children: <Widget>[
                                        Text("Next",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: wt / 25)),
                                        SizedBox(width: 2),
                                        Icon(Icons.arrow_forward,
                                            size: 20, color: Colors.black)
                                      ])))
                      ],
                    )),
                /*  _currentPage != _numPages - 1
                ? Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomRight,
                      child: FlatButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Next',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Text(''),*/
              ],
            ),
          ),

          /* bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 100.0,
              width: double.infinity,
              color: Colors.white,
              child: GestureDetector(
                onTap: () => print('Get started'),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        color: Color(0xFF5B16D0),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),*/
        )));
  }

  Widget buildPage(String img, String title, String descr) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //   mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(img),
              height: ht / 1.5,
              width: wt,
            ),
          ),
          // SizedBox(height: ht / 10),
          Text(
            title,
            style: onboardingtitle.copyWith(fontSize: wt / 15),
          ),
          SizedBox(height: 15.0),
          Expanded(
            child: Text(
              descr,
              style: onboardingsubtitle.copyWith(fontSize: wt / 20),
            ),
          )
        ],
      ),
    );
  }
}
