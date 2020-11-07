import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techhr/styles/loading.dart';
import 'package:techhr/styles/styles.dart';
import 'package:techhr/view/screens/backgroundsplash.dart';

class Emp_Compensation extends StatefulWidget {
  @override
  _Emp_Compensation createState() => _Emp_Compensation();
}

class _Emp_Compensation extends State<Emp_Compensation> {
  double ht, wt;
  bool loading = false;

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
                  Padding(padding: EdgeInsets.all(9.0), child: _buildHead()),
                  //_buildCard("Basic"),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: loading
                          ? Center(child: Loading())
                          : Column(children: <Widget>[
                              _show(),
                              SizedBox(height: 7),
                              _showData(),
                            ])),
                ]),
          )
        ]))))));
  }

  _show() {
    return Row(
      children: <Widget>[
        _showCard("NOT\nPROCESSED", "0"),
        _showCard("PROCESSED", "2"),
        _showCard("ELAPSED", "5")
      ],
    );
  }

  _showCard(String st, String cnt) {
    return Container(
      width: wt / 3.5,
      height: ht / 5,
      child: Card(
        shadowColor: materialColor,
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(4),
                  child: Center(
                      child: Text(st,
                          style: TextStyle(
                              color: Colors.blueGrey[500],
                              fontSize: wt / 30,
                              fontWeight: FontWeight.w600)))),
              Padding(
                  padding: EdgeInsets.all(4),
                  child: Center(
                      child: Text(cnt,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: wt / 20,
                              fontWeight: FontWeight.w600)))),
            ]),
      ),
    );
  }

  _showData() {
    var ts = TextStyle(
        fontSize: wt / 30, fontWeight: FontWeight.w600, color: Colors.black);
    var ds = TextStyle(
        fontSize: wt / 34,
        fontWeight: FontWeight.w400,
        color: Colors.grey[400]);
    return Container(
        child: Padding(
            padding: EdgeInsets.all(7.0),
            child: DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(""),
                ),
                DataColumn(
                  label: Text(""),
                ),
                DataColumn(
                  label: Text(""),
                ),
              ],
              rows: <DataRow>[
                row("Day", "13-02-2020"),
                row("For Working", "Sunday"),
                row("Status", "Requested")
              ],
            )));
  }

  DataRow row(String title, String data) {
    var ts = TextStyle(
        fontSize: wt / 30, fontWeight: FontWeight.w600, color: Colors.black);
    var ds = TextStyle(
        fontSize: wt / 30,
        fontWeight: FontWeight.w500,
        color: Colors.blueGrey[500]);
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(title, style: ts)),
        DataCell(Text(':')),
        DataCell(Text(data, style: ds)),
      ],
    );
  }

  Widget _buildHead() {
    return Text(
      "Compensation Requests",
      style: hst.copyWith(fontSize: wt / 22),
    );
  }
}
