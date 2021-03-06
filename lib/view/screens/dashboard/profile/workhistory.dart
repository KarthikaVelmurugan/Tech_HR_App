import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techhr/styles/styles.dart';
import 'package:techhr/view/screens/dashboard/profile/workhistoryaddpage.dart';

class WorkHistory extends StatefulWidget {
  var work_history;
  WorkHistory({this.work_history});
  @override
  _WorkHistory createState() => _WorkHistory();
}

class _WorkHistory extends State<WorkHistory> {
  double ht, wt;
  var hst = TextStyle(
      color: fontColor, letterSpacing: 0.5, fontWeight: FontWeight.w700);

  var lst = TextStyle(
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: Colors.blueGrey[400]);

  @override
  void initState() {
    super.initState();
    Fluttertoast.showToast(
        msg: widget.work_history.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: toastColor,
        textColor: Colors.white,
        fontSize: wt / 20);
  }

  @override
  Widget build(BuildContext context) {
    ht = MediaQuery.of(context).size.height;
    wt = MediaQuery.of(context).size.width;

    return MaterialApp(
        title: "TECH - HR",
        debugShowCheckedModeBanner: false,
        color: materialColor,
        home: Scaffold(
            body: SingleChildScrollView(
                child: Background(
                    child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
              SizedBox(
                height: 1,
              ),
              Container(
                  height: wt / 6,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(2.0),
                          child: InkWell(
                            child: Icon(FontAwesomeIcons.angleLeft,
                                size: 28, color: Colors.black),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Text("ADD",
                                style: TextStyle(
                                    fontSize: wt / 22,
                                    color: materialColor,
                                    fontWeight: FontWeight.bold)),
                            onTap: () {
                              setState(() {
                                print("press profileinfo edit page");
                                //navigate to edit page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WorkHistoryEditingPage(
                                              work_history:
                                                  widget.work_history)),
                                );
                              });
                            },
                          ),
                        )
                      ])),
              Container(
                width: wt,
                padding: EdgeInsets.all(9.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(9.0), child: _buildHead()),
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Tap to View Your full Work History Details",
                          style: lst.copyWith(fontSize: wt / 27),
                        )),
                    SizedBox(height: wt / 5),
                    _buildCard("Work History", "-"),
                    SizedBox(height: wt / 9),
                  ],
                ),
              )
            ]))))));
  }

  Widget _buildCard(String title, String c) {
    return Container(
        // height: wt / 4,
        child: Card(
            elevation: 20,
            shadowColor: Colors.deepPurple[400],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: ExpansionCard(
              borderRadius: 20,
              title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(title, style: hst.copyWith(fontSize: wt / 26)),
                  ]),
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(" - ", style: lst.copyWith(fontSize: wt / 28)))
              ],
            )));
  }

  Widget _buildHead() {
    return Text(
      "Work History Details",
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
