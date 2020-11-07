import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techhr/model/personaldata.dart';
import 'package:techhr/styles/styles.dart';
import 'package:techhr/view/screens/dashboard/profile/personalInfoEditing.dart';

class PersonalInfo extends StatefulWidget {
  var personal_details;
  PersonalInfo({this.personal_details});
  @override
  _PersonalInfo createState() => _PersonalInfo();
}

class _PersonalInfo extends State<PersonalInfo> {
  double ht, wt;
  var hst = TextStyle(
      color: fontColor, letterSpacing: 0.5, fontWeight: FontWeight.w700);
  var lst = TextStyle(
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: Colors.blueGrey[400]);
  InfoData i = new InfoData();
  PersonalData d = new PersonalData();

  @override
  void initState() {
    setData(widget.personal_details);
  }

  setData(var a) {
    i.adhaar_name.text = a['adhaar_name'];
    i.adhaar_number.text = a['adhaar_number'];
    i.adhaar_proof.text = a['adhaar_proof'];
    i.bank_ac_number.text = a['bank_ac_number'];
    i.bank_branch.text = a['bank_branch'];
    i.bank_ifsc.text = a['bank_ifsc'];
    i.bank_name.text = a['bank_name'];
    i.bank_proof.text = a['bank_proof'];
    i.blood_group.text = a['blood_group'];
    i.dob.text = a['dob'];
    i.employee_id.text = a['employee_id'];
    i.father_dob.text = a['father_dob'];
    i.father_mobile.text = a['father_mobile'].toString();
    i.father_name.text = a['father_name'];
    i.first_name.text = a['first_name'];
    i.gender.text = a['gender'];
    i.id_expiry.text = a['id_expiry'].toString();
    i.id_name.text = a['id_name'];
    i.id_number.text = a['id_number'].toString();
    i.id_proof.text = a['id_proof'];
    i.international_employee.text = a['international_employee'].toString();
    i.last_name.text = a['last_name'];
    i.maritial_status.text = a['maritial_status'];
    i.marriage_date.text = a['marriage_date'];
    //  i.mobile.text = a['mobile'];
    i.mother_dob.text = a['mother_dob'];
    i.mother_mobile.text = a['mother_mobile'].toString();
    i.mother_name.text = a['mother_name'];
    i.nationality.text = a['nationality'];
    i.official_email.text = a['official_email'];
    i.official_mobile.text = a['official_mobile'];
    i.pan_number.text = a['pan_number'];
    i.pan_proof.text = a['pan_proof'];
    i.personal_email.text = a['personal_email'];
    i.personal_mobile.text = a['personal_mobile'];
    i.specially_disabled.text = a['specially_disabled'].toString();
    i.spouse_dob.text = a['spouse_dob'];
    i.spouse_mobile.text = a['spouse_mobile'].toString();
    i.spouse_name.text = a['spouse_name'].toString();
  }

  @override
  Widget build(BuildContext context) {
    ht = MediaQuery.of(context).size.height;
    wt = MediaQuery.of(context).size.width;

    return MaterialApp(
        title: "Grove",
        debugShowCheckedModeBanner: false,
        color: Colors.white,
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
                                builder: (context) => EditingPage(
                                    personal_details: widget.personal_details)),
                          );
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(9.0), child: _buildHead()),
                combo("Aadhar Name", i.adhaar_name),
                SizedBox(height: 2),
                combo("Aadhar Number", i.adhaar_number),
                SizedBox(height: 2),
                combo("Aadhar Proof", i.adhaar_proof),
                SizedBox(height: 2),
                combo("Bank A/C Number", i.bank_ac_number),
                SizedBox(height: 2),
                combo("Bank branch", i.bank_branch),
                SizedBox(height: 2),
                combo("Bank IFSC", i.bank_ifsc),
                SizedBox(height: 2),
                combo("Bank Name", i.bank_name),
                SizedBox(height: 2),
                combo("Bank Proof", i.bank_proof),
                SizedBox(height: 2),
                combo("Blood Group", i.blood_group),
                SizedBox(height: 2),
                combo("Date Of Birth", i.dob),
                SizedBox(height: 2),
                combo("Employee ID", i.employee_id),
                SizedBox(height: 2),
                combo("Father DOB", i.father_dob),
                SizedBox(height: 2),
                combo("Father Mobile No", i.father_mobile),
                SizedBox(height: 2),
                combo("Father Name", i.father_name),
                SizedBox(height: 2),
                combo("First Name", i.first_name),
                SizedBox(height: 2),
                combo("Gender", i.gender),
                SizedBox(height: 2),
                combo("ID Expiry", i.id_expiry),
                SizedBox(height: 2),
                combo("ID Name", i.id_name),
                SizedBox(height: 2),
                combo("ID Number", i.id_number),
                SizedBox(height: 2),
                combo("ID Proof", i.id_proof),
                SizedBox(height: 2),
                combo("International Employee", i.international_employee),
                SizedBox(height: 2),
                combo("Last Name", i.last_name),
                SizedBox(height: 2),
                combo("Maritial Status", i.maritial_status),
                SizedBox(height: 2),
                combo("Marriage Date", i.marriage_date),
                SizedBox(height: 2),
                combo("Mobile", i.mobile),
                SizedBox(height: 2),
                combo("Mother DOB", i.mother_dob),
                SizedBox(height: 2),
                combo("Mother Mobile No", i.mother_mobile),
                SizedBox(height: 2),
                combo("Mother Name", i.mother_name),
                SizedBox(height: 2),
                combo("Nationality", i.nationality),
                SizedBox(height: 2),
                combo("Official Email", i.official_email),
                SizedBox(height: 2),
                combo("Official Mobile Number", i.official_mobile),
                SizedBox(height: 2),
                combo("PAN No", i.pan_number),
                SizedBox(height: 2),
                combo("PAN Proof", i.pan_proof),
                SizedBox(height: 2),
                combo("Personal Email", i.personal_email),
                SizedBox(height: 2),
                combo("Personal Mobile", i.personal_mobile),
                SizedBox(height: 2),
                combo("Specially Disabled", i.specially_disabled),
                SizedBox(height: 2),
                combo("Spouse DOB", i.spouse_dob),
                SizedBox(height: 2),
                combo("Spouse Mobile", i.spouse_mobile),
                SizedBox(height: 2),
                combo("Spouse Name", i.spouse_name),
                SizedBox(height: 2),
              ],
            ),
          )
        ])))));
  }

  Widget combo(String label, TextEditingController t) {
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
      "Personal Info",
      style: hst.copyWith(fontSize: wt / 20),
    );
  }

  Widget _buildLabel(String label) {
    return Text(label, style: lst.copyWith(fontSize: wt / 28));
  }

  Widget _buildField(TextEditingController c) {
    if (c.text == "") {
      setState(() {
        c.text = " Nil ";
      });
    }
    return Container(
        margin: new EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
        child: Card(
          elevation: 15,
          shadowColor: Colors.deepPurple[400],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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

class InfoData {
  //personal Info
  TextEditingController adhaar_name = new TextEditingController();
  // String dobC;
  TextEditingController adhaar_number = new TextEditingController();
  //String nationalityC;
  TextEditingController adhaar_proof = new TextEditingController();
  TextEditingController bank_ac_number = new TextEditingController();
  TextEditingController bank_branch = new TextEditingController();
  // String genderC;
  TextEditingController bank_ifsc = new TextEditingController();
  // String maritalC;
  TextEditingController bank_name = new TextEditingController();
  TextEditingController bank_proof = new TextEditingController();
  TextEditingController blood_group = new TextEditingController();
  TextEditingController dob = new TextEditingController();
  //Home address info
  TextEditingController employee_id = new TextEditingController();
  TextEditingController father_dob = new TextEditingController();
  TextEditingController father_mobile = new TextEditingController();
  TextEditingController father_name = new TextEditingController();
  TextEditingController first_name = new TextEditingController();
  //String countryC;
  //String stateC;
  //String cityC;
  //Emergency contact
  TextEditingController gender = new TextEditingController();

  //Job info
  TextEditingController id_expiry = new TextEditingController();
  TextEditingController id_name = new TextEditingController();
  TextEditingController id_number = new TextEditingController();
  TextEditingController id_proof = new TextEditingController();
  TextEditingController international_employee = new TextEditingController();
  TextEditingController last_name = new TextEditingController();
  TextEditingController maritial_status = new TextEditingController();
  TextEditingController marriage_date = new TextEditingController();
  TextEditingController mobile = new TextEditingController();
  TextEditingController mother_dob = new TextEditingController();
  TextEditingController mother_mobile = new TextEditingController();
  //Dependents
  TextEditingController mother_name = new TextEditingController();
  TextEditingController nationality = new TextEditingController();
  TextEditingController pan_number = new TextEditingController();
  TextEditingController pan_proof = new TextEditingController();
  TextEditingController personal_email = new TextEditingController();
  TextEditingController personal_mobile = new TextEditingController();
  TextEditingController specially_disabled = new TextEditingController();
  TextEditingController spouse_dob = new TextEditingController();
  TextEditingController spouse_mobile = new TextEditingController();
  TextEditingController spouse_name = new TextEditingController();

  TextEditingController official_email = new TextEditingController();

  TextEditingController official_mobile = new TextEditingController();
}
