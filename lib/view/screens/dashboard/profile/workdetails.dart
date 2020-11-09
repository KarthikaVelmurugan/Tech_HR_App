import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techhr/styles/styles.dart';

class WorkDetails extends StatefulWidget {
  var work_details;
  WorkDetails({this.work_details});
  @override
  _WorkDetails createState() => _WorkDetails();
}

class _WorkDetails extends State<WorkDetails> {
  double ht, wt;
  var hst = TextStyle(
      color: fontColor, letterSpacing: 0.5, fontWeight: FontWeight.w700);
  var lst = TextStyle(
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: Colors.blueGrey[400]);
  WorkInfoData i = new WorkInfoData();

  @override
  void initState() {
    //   i.data();
    print(widget.work_details['branch']);
    Fluttertoast.showToast(
        msg: widget.work_details.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: toastColor,
        textColor: Colors.white,
        fontSize: wt / 20);
    setData(widget.work_details);
    super.initState();
  }

  setData(var d) {
    i.branch.text = d['branch'];
    i.confirmation_date.text = d['confirmation_date'];
    i.date_of_join.text = d['date_of_join'];
    i.department.text = d['department'];
    i.designation.text = d['designation'];
    i.epf_number.text = d['epf_number'];
    i.esi_id.text = d['esi_id'];
    i.job_status.text = d['job_status'];
    i.payment_mode.text = d['payment_mode'];
    i.probation_period.text = d['probation_period'];
    i.reporting_manager.text = d['reporting_manager'];
    i.shifts.text = d['shifts'];
    i.uan_number.text = d['uan_number'];
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
            body: Background(
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
                  /*  Padding(
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
                                builder: (context) => EditingPage()),
                          );
                        });
                      },
                    ),
                  )*/
                ]),
          ),
          Container(
            width: wt,
            padding: EdgeInsets.all(9.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(9.0), child: _buildHead()),
                combo("Branch", i.branch),
                SizedBox(height: 2),
                combo("Confirmation_date", i.confirmation_date),
                SizedBox(height: 2),
                combo("Date-of-join", i.date_of_join),
                SizedBox(height: 2),
                combo("Department", i.department),
                SizedBox(height: 2),
                combo("Designation", i.designation),
                SizedBox(height: 2),
                combo("EPF - Number", i.epf_number),
                SizedBox(height: 2),
                combo("ESI - ID", i.esi_id),
                SizedBox(height: 2),
                combo("Job status", i.job_status),
                SizedBox(height: 2),
                combo("Payment mode", i.payment_mode),
                SizedBox(height: 2),
                combo("Probation Period", i.probation_period),
                SizedBox(height: 2),
                combo("Reporting - manager", i.reporting_manager),
                SizedBox(height: 2),
                combo("Shifts", i.shifts),
                SizedBox(height: 2),
                combo("UAN - Number", i.uan_number),
                SizedBox(height: 2),
              ],
            ),
          )
        ])))));
  }

  Widget combo(String label, TextEditingController t) {
    if (t.text == "") {
      setState(() {
        t.text = " Nil ";
      });
    }
    return Container(
        padding: EdgeInsets.all(5.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildLabel(label),
              SizedBox(height: 1),
              _buildField(t),
            ]));
  }

  Widget _buildHead() {
    return Text(
      "Work Details",
      style: hst.copyWith(fontSize: wt / 20),
    );
  }

  Widget _buildLabel(String label) {
    return Text(label, style: lst.copyWith(fontSize: wt / 28));
  }

  Widget _buildField(TextEditingController c) {
    return Container(
        margin: new EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
        child: Card(
          elevation: 10,
          shadowColor: Colors.deepPurple[400],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Center(
            child: TextFormField(
              controller: c,
              readOnly: true,
              enableInteractiveSelection: false,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: wt / 26,
                  height: 0.4,
                  color: fontColor,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
        ));
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

class WorkInfoData {
  //personal Info
  TextEditingController branch = new TextEditingController();
  // String dobC;
  TextEditingController confirmation_date = new TextEditingController();
  //String nationalityC;
  TextEditingController date_of_join = new TextEditingController();
  TextEditingController department = new TextEditingController();
  TextEditingController designation = new TextEditingController();
  // String genderC;
  TextEditingController epf_number = new TextEditingController();
  // String maritalC;
  TextEditingController esi_id = new TextEditingController();
  TextEditingController job_status = new TextEditingController();
  TextEditingController payment_mode = new TextEditingController();
  TextEditingController probation_period = new TextEditingController();
  //Home address info
  TextEditingController reporting_manager = new TextEditingController();
  TextEditingController shifts = new TextEditingController();

  TextEditingController uan_number = new TextEditingController();
}
