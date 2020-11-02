//import 'package:email_launcher/email_launcher.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techhr/styles/styles.dart';
//import 'package:url_launcher/url_launcher.dart';

class Members extends StatefulWidget {
  @override
  _Members createState() => _Members();
}

class _Members extends State<Members> {
  double ht, wt;
  String mob = "9999009900";
  var hst = TextStyle(
      color: fontColor, letterSpacing: 0.5, fontWeight: FontWeight.w700);

  var lst = TextStyle(
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: Colors.blueGrey[400]);

  @override
  void initState() {
    super.initState();
  }

  /* void _launchEmail() async {
    Email email = Email(
        to: ['one@gmail.com,two@gmail.com'],
        cc: ['foo@gmail.com'],
        bcc: ['bar@gmail.com'],
        subject: 'subject',
        body: 'body');
    await EmailLauncher.launch(email);
  }*/

  @override
  Widget build(BuildContext context) {
    ht = MediaQuery.of(context).size.height;
    wt = MediaQuery.of(context).size.width;

    return MaterialApp(
        title: "TECH - HR",
        debugShowCheckedModeBanner: false,
        color: materialColor,
        home: Scaffold(
            body: Background(
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            //  height: wt / 6,
            child: Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: InkWell(
                      child: Icon(FontAwesomeIcons.angleLeft,
                          size: 28, color: Colors.black),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ]),
          ),
          Container(
            width: wt,
            padding: EdgeInsets.all(9.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(6.0), child: _buildHead()),
                  Padding(padding: EdgeInsets.all(6.0), child: _buildCard()),
                  Padding(padding: EdgeInsets.all(6.0), child: _buildCard()),
                  Padding(padding: EdgeInsets.all(6.0), child: _buildCard()),
                  Padding(padding: EdgeInsets.all(6.0), child: _buildCard()),
                  Padding(padding: EdgeInsets.all(6.0), child: _buildCard()),
                ]),
          )
        ])))));
  }

  Widget _buildCard() {
    return Container(
        height: wt / 2,
        child: Card(
          elevation: 15,
          shadowColor: materialColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: <Widget>[
              Container(
                  color: materialColor,
                  width: wt / 3,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(Icons.person,
                                color: Colors.white, size: 50)),
                        Text(
                          "Manisha",
                          style: TextStyle(
                              fontSize: wt / 28,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "B10003",
                          style: TextStyle(
                              fontSize: wt / 30,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        )
                      ])),
              Container(
                  child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _info(
                      1,
                      "Executive",
                      Icon(FontAwesomeIcons.award,
                          size: 16, color: Colors.black54),
                    ),
                    _info(
                      2,
                      "Default",
                      Icon(FontAwesomeIcons.userFriends,
                          size: 16, color: Colors.black54),
                    ),
                    _info(
                      3,
                      "Marketing",
                      Icon(FontAwesomeIcons.userFriends,
                          size: 16, color: Colors.black54),
                    ),
                    _info(
                      4,
                      "REGOFF",
                      Icon(FontAwesomeIcons.calculator,
                          size: 16, color: Colors.black54),
                    ),
                    _info(
                      5,
                      "9 Mnths",
                      Icon(Icons.calendar_today,
                          size: 16, color: Colors.black54),
                    ),
                    InkWell(
                      child: _info(
                        6,
                        mob,
                        Icon(Icons.call, size: 16, color: Colors.black54),
                      ),
                      onTap: () {
                        print("call");
                        // launch("tel://" + mob);
                      },
                    ),
                    InkWell(
                      child: _info(
                        7,
                        "xyz@gmail.com",
                        Icon(Icons.email, size: 16, color: Colors.black54),
                      ),
                      onTap: () {
                        // _launchEmail();
                      },
                    )
                  ],
                ),
              ))
            ],
          ),
        ));
  }

  _info(int i, String s, Icon icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        icon,
        SizedBox(width: 15),
        Text(s,
            style: TextStyle(
                fontSize: wt / 30,
                fontWeight: FontWeight.w500,
                color: i < 6 ? Colors.black54 : Colors.greenAccent))
      ],
    );
  }

  Widget _buildHead() {
    return Text(
      "Members Details",
      style: hst.copyWith(fontSize: wt / 20),
    );
  }
}

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_top.png",
              width: size.width * 0.6,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
