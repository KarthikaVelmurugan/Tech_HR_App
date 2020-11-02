import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:techhr/styles/loading.dart';
import 'package:techhr/styles/styles.dart';
import 'package:techhr/view/screens/backgroundsplash.dart';

class Emp_Attendance extends StatefulWidget {
  @override
  _Emp_Attendance createState() => _Emp_Attendance();
}

class _Emp_Attendance extends State<Emp_Attendance> {
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
        theme: ThemeData(backgroundColor: materialColor),
        home: Scaffold(
            body: SingleChildScrollView(
                child: Background(
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
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                  Theme(
                                    data: ThemeData(
                                        primarySwatch: Colors.deepPurple),
                                    child: _showCalendar(),
                                  ),
                                  _showData(),
                                ])),
                ]),
          )
        ])))));
  }

  _showCalendar() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(6.0),
          child: Text("Select Date to view your attendance report",
              style: lst.copyWith(fontSize: wt / 26)),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
              width: wt / 2,
              height: ht / 12,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(4.0),
              child: Center(
                child: Text(
                  '${selectedDate.day} / ${selectedDate?.month} /  ${selectedDate?.year} ',
                  style: hst.copyWith(fontSize: wt / 26),
                  textAlign: TextAlign.center,
                ),
              )),
        ),
        SizedBox(height: 10),
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          onPressed: () => _selectDate(context), // Refer step 3
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Pick Date',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: wt / 28),
            ),
          ),
          color: materialColor,
        ),
      ],
    );
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        builder: (context, child) {
          return Theme(
            data: ThemeData(
                primarySwatch:
                    Colors.deepPurple), // This will change to light theme.
            child: child,
          );
        },
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
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
        child: Center(
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
            row("Date", "13-02-2020"),
            row("Shift", "day"),
            row("Team Name", "Crackers"),
            row("Check In", " - "),
            row("Check Out", " - "),
            row("All Punches", "Pending"),
            row("Late", " - "),
            row("Early Out", " - "),
            row("Total", " - "),
          ],
        )));
  }

  DataRow row(String title, String data) {
    var ts = TextStyle(
        fontSize: wt / 27, fontWeight: FontWeight.w700, color: Colors.black);
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
      "Attendance Regularizations",
      style: hst.copyWith(fontSize: wt / 23),
    );
  }
}
