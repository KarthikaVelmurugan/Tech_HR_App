import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techhr/styles/loading.dart';
import 'package:techhr/styles/styles.dart';
import 'package:techhr/view/screens/backgroundsplash.dart';

class Emp_Notice extends StatefulWidget {
  @override
  _Emp_Notice createState() => _Emp_Notice();
}

class _Emp_Notice extends State<Emp_Notice> {
  DateTime pickedDatenotice;
  DateTime pickedDatelast;
  List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  double ht, wt;
  bool loading = false;
  bool _letterVisible = false;
  String letter = '';
  TextEditingController _letterController = TextEditingController();
  FocusNode letterFocus = FocusNode();

  var hst = TextStyle(
      color: fontColor, letterSpacing: 0.5, fontWeight: FontWeight.w700);

  var lst = TextStyle(
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: Colors.blueGrey[400]);

  @override
  void initState() {
    pickedDatenotice = DateTime.now();
    pickedDatelast = DateTime.now();
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
            bottomSheet: _showbuttons(),
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
              Center(
                  child: Container(
                // width: wt,
                padding: EdgeInsets.all(9.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(9.0), child: _buildHead()),
                      //_buildCard("Basic"),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: loading
                            ? Center(child: Loading())
                            : Center(
                                child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  _showData(),
                                ],
                              )),
                      )
                    ]),
              ))
            ]))))));
  }

  _showbuttons() {
    return Container(
      width: wt,
      height: wt / 6,
      // color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            width: wt / 2,
            child: Padding(
                padding: EdgeInsets.all(7.0),
                child: MaterialButton(
                  onPressed: () {
                    //cancel
                    _showAlert();
                  },
                  color: Colors.blueGrey[50],
                  child: Center(
                      child: Text("Cancel",
                          style: TextStyle(
                            fontSize: wt / 24,
                            color: fontColor,
                          ))),
                )),
          ),
          Container(
            width: wt / 2,
            child: Padding(
                padding: EdgeInsets.all(7.0),
                child: MaterialButton(
                  onPressed: () {
                    //save
                    print("submitted");
                    Navigator.pop(context);
                  },
                  color: materialColor,
                  child: Center(
                      child: Text("Submit",
                          style: TextStyle(
                            fontSize: wt / 24,
                            color: Colors.white,
                          ))),
                )),
          ),
        ],
      ),
    );
  }

  _showData() {
    return Container(
        padding: EdgeInsets.all(8.0),
        child: Container(
            // width: wt,
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                noticeDate('NoticeDate', 1),
                SizedBox(height: 7),
                lastWorkingDate('Last Working Date', 2),
                SizedBox(height: 7),
                letterBox('Letter', 3),
              ],
            )));
  }

  Future<bool> _showAlert() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text(
          'Discard change?',
          style: TextStyle(fontSize: wt / 20),
        ),
        elevation: 5,
        contentPadding: EdgeInsets.all(20),
        content: SizedBox(
          height: wt / 20,
        ),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Text("CANCEL",
                style: TextStyle(color: materialColor, fontSize: wt / 25)),
          ),
          SizedBox(height: 16),
          new GestureDetector(
            onTap: () {
              //write code for discard\
              //  Navigator.of(context).pop(true);
              setState(() {
                letterFocus.unfocus();
                _letterController.clear();
                Navigator.pop(context);
              });
            },
            child: Text("DISCARD",
                style: TextStyle(color: materialColor, fontSize: wt / 25)),
          ),
          SizedBox(height: wt / 20),
        ],
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Text(label, style: lst.copyWith(fontSize: wt / 25));
  }

  Widget letterBox(String label, int i) {
    return Container(
        padding: EdgeInsets.all(4.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(6.0),
                child: _buildLabel(label),
              ),
              _letterVisible
                  ? ListTile(
                      contentPadding: EdgeInsets.all(6),
                      leading: CircleAvatar(
                        child: Icon(Icons.note, size: 22, color: materialColor),
                        radius: 22,
                        backgroundColor: Colors.blueGrey[50],
                      ),
                      title: Container(
                          // width: wt / 1.5,
                          //height: ht / 4,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[50],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: Text(letter,
                                style: TextStyle(
                                    fontSize: wt / 25,
                                    color: fontColor,
                                    fontWeight: FontWeight.w500)),
                          )))
                  : _listTiles(Icon(Icons.note, size: 22, color: materialColor),
                      "Letter"),
            ]));
  }

  Widget _listTiles(Icon icons, String label) {
    return ListTile(
        onTap: () {
          FocusScope.of(context).requestFocus(letterFocus);
          _showNoteBottomSheet();
        },
        contentPadding: EdgeInsets.all(6),
        leading: CircleAvatar(
          child: icons,
          radius: 22,
          backgroundColor: Colors.blueGrey[50],
        ),
        title: Container(
          // width: wt / 1.5,
          //height: ht / 10,
          decoration: BoxDecoration(
            color: Colors.blueGrey[50],
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(20.0),
          child: Text('Start Typing....',
              style: TextStyle(
                  fontSize: wt / 26,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w500)),
        ));
  }

  _showNoteBottomSheet() {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
        ),
        builder: (builder) {
          return SingleChildScrollView(
              child: Container(
                  height: ht * 0.80,
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.close,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Text("Note",
                              style: TextStyle(
                                color: fontColor,
                              )),
                          InkWell(
                            onTap: () {
                              //added notes
                              setState(() {
                                _letterVisible = !_letterVisible;
                              });
                              Navigator.pop(context);
                            },
                            child: Text("ADD",
                                style: TextStyle(
                                    fontSize: wt / 26,
                                    color: fontColor,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                      Expanded(
                        child: Container(
                            height: wt / 2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blueGrey.shade50),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextField(
                                focusNode: letterFocus,
                                controller: _letterController,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                onChanged: (value) {
                                  setState(() {
                                    letter = value;
                                  });
                                },
                                cursorColor: fontColor,
                                style: TextStyle(
                                    fontSize: wt / 26,
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration.collapsed(
                                  hintText: 'Start Typing......',
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                  border: InputBorder.none,
                                ),
                              ),
                            )

                            /*  TextFormField(
                        controller: _noteController,
                        cursorColor: fontColor,
                        
                        maxLength: 10,
                        onChanged: (value) {
                          setState(() {
                            notes = value;
                          });
                        },
                      ),*/
                            ),
                      )
                    ],
                  )));
        });
  }

  Widget noticeDate(String label, int i) {
    return Container(
        padding: EdgeInsets.all(4.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(6.0),
                child: _buildLabel(label),
              ),
              Container(
                  // width: wt / 1.5,
                  height: ht / 15,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(4.0),
                  child: Center(
                      child: ListTile(
                    title: Center(
                      child: Text(
                        "${pickedDatenotice.day} ${months[pickedDatenotice.month - 1]} ${pickedDatenotice.year}",
                        style: TextStyle(
                            fontSize: wt / 26,
                            height: 1,
                            color: fontColor,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    trailing: Icon(
                      FontAwesomeIcons.solidCalendar,
                      //Icons.date_range,
                      size: 22,
                      color: materialColor,
                    ),
                    onTap: _pickDate,
                  )))
            ]));
  }

  Widget lastWorkingDate(String label, int i) {
    return Container(
        padding: EdgeInsets.all(4.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(6.0),
                child: _buildLabel(label),
              ),
              Container(
                  // width: wt / 1.5,
                  height: ht / 15,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(4.0),
                  child: Center(
                      child: ListTile(
                    title: Center(
                      child: Text(
                        "${pickedDatelast.day} ${months[pickedDatelast.month - 1]} ${pickedDatelast.year}",
                        style: TextStyle(
                            fontSize: wt / 26,
                            height: 1,
                            color: fontColor,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    trailing: Icon(
                      FontAwesomeIcons.solidCalendar,
                      //Icons.date_range,
                      size: 22,
                      color: materialColor,
                    ),
                    onTap: _pickDateL,
                  )))
            ]));
  }

  _pickDateL() async {
    DateTime date = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: ThemeData(
              primarySwatch:
                  Colors.deepPurple), // This will change to light theme.
          child: child,
        );
      },
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: pickedDatelast,
    );
    if (date != null)
      setState(() {
        pickedDatelast = date;
      });
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: ThemeData(
              primarySwatch:
                  Colors.deepPurple), // This will change to light theme.
          child: child,
        );
      },
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: pickedDatenotice,
    );
    if (date != null)
      setState(() {
        pickedDatenotice = date;
      });
  }

  Widget _buildHead() {
    return Text(
      "Notice Period",
      style: hst.copyWith(fontSize: wt / 20),
    );
  }
}
