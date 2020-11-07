import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techhr/styles/loading.dart';
import 'package:techhr/styles/styles.dart';
import 'package:techhr/view/screens/backgroundsplash.dart';

class Emp_Regularization extends StatefulWidget {
  @override
  _Emp_Regularization createState() => _Emp_Regularization();
}

class _Emp_Regularization extends State<Emp_Regularization> {
  double ht, wt;
  bool loading = false;
  bool _press = false;

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
                              _showRise(),
                              _showData(),
                            ])),
                ]),
          )
        ]))))));
  }

  _showRise() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(6.0),
          child: Text("Tap to send Regularization Request",
              style: lst.copyWith(fontSize: wt / 26)),
        ),
        SizedBox(height: 10),
        InkWell(
          onTap: () {
            setState(() {
              _press = !_press;
            });
          },
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
                width: wt / 2,
                height: ht / 12,
                decoration: BoxDecoration(
                  color: _press ? Colors.deepPurple[200] : Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(4.0),
                child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                      Text(
                        "Send Request",
                        style: hst.copyWith(fontSize: wt / 28),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.send, size: 25, color: materialColor)
                    ]))),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  _showData() {
    var ts = TextStyle(
        fontSize: wt / 30, fontWeight: FontWeight.w600, color: Colors.black);
    var ds = TextStyle(
        fontSize: wt / 34,
        fontWeight: FontWeight.w400,
        color: Colors.grey[400]);
    return Padding(
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
            row("Emp_Name", "Karthika"),
            row("Emp_ID", "B13009"),
            row("Day", "13-10-2000"),
            row("Regularization\nType", " - "),
            row("Reason \nType", " - "),
            row("Status", " - "),
            row("Actions", " - "),
          ],
        ));
  }

  DataRow row(String title, String data) {
    var ts = TextStyle(
        fontSize: wt / 28, fontWeight: FontWeight.w700, color: Colors.black);
    var ds = TextStyle(
        fontSize: wt / 27,
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
      "Regularizations Requests",
      style: hst.copyWith(fontSize: wt / 23),
    );
  }
}
