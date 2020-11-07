import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techhr/styles/loading.dart';
import 'package:techhr/styles/styles.dart';
import 'package:techhr/view/screens/backgroundsplash.dart';

class Emp_Tax extends StatefulWidget {
  @override
  _Emp_Tax createState() => _Emp_Tax();
}

class _Emp_Tax extends State<Emp_Tax> {
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
                    child: loading ? Center(child: Loading()) : _showData(),
                  ),
                ]),
          )
        ]))))));
  }

  _showData() {
    var ts = TextStyle(
        fontSize: wt / 30, fontWeight: FontWeight.w600, color: Colors.black);
    var ds = TextStyle(
        fontSize: wt / 34,
        fontWeight: FontWeight.w400,
        color: Colors.grey[400]);
    return DataTable(
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
        row("Emp_Name", "Karthika"),
        row("Emp_ID", "B13009"),
        row("From Date", "13-10-2000"),
        row("From Half", "15-8-2002"),
        row("To Date", "12-8-2020"),
        row("To Half", "30-1-2020"),
        row("Duration", "6month"),
        row("Leave", "2"),
        row("Status", "Accepted"),
        row("Actions", "Working")
      ],
    );
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
      "Tax Planner",
      style: hst.copyWith(fontSize: wt / 20),
    );
  }
}
