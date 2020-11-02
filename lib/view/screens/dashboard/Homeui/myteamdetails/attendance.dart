import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techhr/styles/loading.dart';
import 'package:techhr/styles/styles.dart';
import 'package:techhr/view/screens/backgroundsplash.dart';

class Attendance extends StatefulWidget {
  @override
  _Attendance createState() => _Attendance();
}

class _Attendance extends State<Attendance> {
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
                    child: loading ? Center(child: Loading()) : makeBody(),
                  ),
                ]),
          )
        ])))));
  }

  Widget makeBody() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.width / 25,
          horizontal: MediaQuery.of(context).size.width / 25),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 5, // widget.food.length,
      itemBuilder: (BuildContext context, int index) {
        return makeCard(); //makeCard(widget.food[index]);
      },
    );
  }

  Widget makeCard() {
    return InkWell(
      child: Container(
          margin: new EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
          child: Card(
            elevation: 20,
            shadowColor: Colors.deepPurple[400],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: makeListTile1(),
          )),
      onTap: () {
        _showDialogueView(context);
      },
    );
  }

  Widget makeListTile1() {
    return ListTile(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      SizedBox(
        width: 10,
      ),
      Icon(FontAwesomeIcons.solidUser, size: 24, color: Colors.blueGrey[200]),
      SizedBox(width: 15),
      Expanded(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text("Karthika",
                  style: TextStyle(
                      fontSize: wt / 26,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey[500])),
              SizedBox(height: 5),
              Text(
                "B13009",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: wt / 30),
              ),
            ]),
      ),
      InkWell(
          child:
              Icon(FontAwesomeIcons.angleRight, color: Colors.black, size: 25),
          onTap: () async {
            _showDialogueView(context);
          })
    ]));
  }

  Future _showDialogueView(BuildContext context) {
    var ts = TextStyle(
        fontSize: wt / 30, fontWeight: FontWeight.w600, color: Colors.black);
    var ds = TextStyle(
        fontSize: wt / 34,
        fontWeight: FontWeight.w400,
        color: Colors.grey[400]);
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Attendance Regularizations')),
          contentPadding: EdgeInsets.all(2.0),
          content: DataTable(
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
              row("Day", "13OCT2020"),
              row("Regularization\nType", "Incorrect\npunches"),
              row("Reason Type", "Missed Out Punch"),
              row("Status", "Pending"),
              row("Actions", "Respond"),
            ],
          ),
          elevation: 10,
          actions: [
            Center(
              child: FlatButton(
                child: Center(
                  child: Text('Ok',
                      style: TextStyle(
                          fontSize: wt / 25,
                          color: materialColor,
                          fontWeight: FontWeight.bold)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        );
      },
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
      "Attendance Regularizations",
      style: hst.copyWith(fontSize: wt / 23),
    );
  }
}
