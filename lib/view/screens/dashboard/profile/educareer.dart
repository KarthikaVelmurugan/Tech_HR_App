import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techhr/styles/styles.dart';
import 'package:techhr/view/screens/dashboard/profile/educareereditingpage.dart';

class EduCarrerDetails extends StatefulWidget {
  var hsc, pg, ug, sslc;
  @override
  EduCarrerDetails({this.hsc, this.pg, this.sslc, this.ug});
  _EduCarrerDetails createState() => _EduCarrerDetails();
}

class _EduCarrerDetails extends State<EduCarrerDetails> {
  double ht, wt;
  var hst = TextStyle(
      color: fontColor, letterSpacing: 0.5, fontWeight: FontWeight.w700);

  var lst = TextStyle(
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: Colors.blueGrey[400]);

  @override
  void initState() {
    print(widget.hsc['marks']);
    Fluttertoast.showToast(
        msg: widget.hsc.toString() +
            widget.sslc.toString() +
            widget.ug.toString() +
            widget.pg.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: toastColor,
        textColor: Colors.white,
        fontSize: wt / 20);
    super.initState();
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
                        child: Column(children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            height: wt / 6,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        setState(() {
                          print("press profileinfo edit page");
                          //navigate to edit page
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EduCareerEditingPage(
                                    edu_career_hsc: widget.hsc,
                                    edu_career_sslc: widget.sslc,
                                    edu_career_ug: widget.ug,
                                    edu_career_pg: widget.pg),
                              ));
                        });
                      },
                    ),
                  )
                ]),
          ),
          Container(
            width: wt,
            padding: EdgeInsets.all(9.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(9.0), child: _buildHead()),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Tap to View Your full EDU-career Details",
                      style: lst.copyWith(fontSize: wt / 27),
                    )),
                SizedBox(height: wt / 5),
                Center(
                  child: _buildCard(
                      "SSLC /Secondary",
                      widget.sslc['sslc_board'],
                      widget.sslc['sslc_marks'],
                      widget.sslc['sslc_proof'],
                      widget.sslc['sslc_school_name'],
                      widget.sslc['sslc_yop']),
                ),
                SizedBox(height: wt / 9),
                Center(
                    child: _buildCard(
                  "Higher Secondary",
                  widget.hsc['hsc_board'],
                  widget.hsc['hsc_marks'],
                  widget.hsc['hsc_proof'],
                  widget.hsc['hsc_school_name'],
                  widget.hsc['hsc_yop'],
                )),
                SizedBox(height: wt / 9),
                Center(
                    child: _buildCard(
                        "Under Graduate / UG",
                        "DEGREE  : " +
                            widget.ug['ug_degree'] +
                            "\n" +
                            widget.ug['ug_university'],
                        widget.ug['ug_marks'],
                        widget.ug['ug_proof'],
                        widget.ug['ug_institution_name'],
                        widget.ug['ug_yop'])),
                SizedBox(height: wt / 9),
                Center(
                  child: _buildCard(
                      "Post Graduate / PG",
                      "DEGREE  : " +
                          widget.pg['pg_degree'] +
                          "\n" +
                          widget.pg['pg_university'],
                      widget.pg['pg_marks'],
                      widget.pg['pg_proof'],
                      widget.pg['pg_institution_name'],
                      widget.pg['pg_yop']),
                )
              ],
            ),
          )
        ]))))));
  }

  Widget _buildCard(String title, String board, String mark, String proof,
      String name, String yop) {
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
                    child: (board == "Nil" || proof == "Nil")
                        ? Text(" - ")
                        : Text(
                            board +
                                "( " +
                                mark +
                                " )" +
                                "\n" +
                                name +
                                "\n" +
                                "PROOF :" +
                                proof +
                                "\n"
                                    "YOP : " +
                                yop,
                            style: lst.copyWith(fontSize: wt / 28)))
              ],
            )));
  }

  Widget _buildHead() {
    return Text(
      "EDU-Carrer Details",
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
