import 'package:flutter/material.dart';
import 'package:techhr/styles/styles.dart';
import 'package:techhr/view/screens/dashboard/profile/profileinfo.dart';

class EduCareerEditingPage extends StatefulWidget {
  var edu_career_sslc, edu_career_hsc, edu_career_ug, edu_career_pg;
  EduCareerEditingPage(
      {this.edu_career_sslc,
      this.edu_career_hsc,
      this.edu_career_ug,
      this.edu_career_pg});
  @override
  _EduCareerEditingPage createState() => _EduCareerEditingPage();
}

class _EduCareerEditingPage extends State<EduCareerEditingPage> {
  String _dropDownNationalValue, _dropDownMaritalValue, _dropDownGenderValue;
  DateTime pickedDate;

  double ht, wt;
  List genderlist = ['Male', 'Female'];
  List maritallist = ['Single', 'Married'];
  List nationallist = [
    'Afghan',
    'Albanian',
    'Algerian',
    'American',
    'Andorran',
    'Angolan',
    'Anguillan',
    'Argentine',
    'Armenian',
    'Australian',
    'Azerbaijani',
    'Austrian',
    'Azerbaijani',
    'Bahamian',
    'Bahraini',
    'Bangladeshi',
    'Barbadian',
    'Belarusian',
    'Belgian',
    'Belizean'
  ];
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
  var hst = TextStyle(
      color: fontColor, letterSpacing: 1, fontWeight: FontWeight.w700);
  var lst = TextStyle(
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: Colors.blueGrey[400]);
  UgData u = new UgData();
  SslcData s = new SslcData();
  HscData h = new HscData();
  PgData p = new PgData();
  String fullname,
      dob,
      national,
      emailadd,
      phnno,
      gender,
      marital,
      personaltax,
      socialinsurane,
      healthinsurance;
  @override
  void initState() {
    //  i.data();
    //remodify the pickeddate value as from DB
    setDataug(widget.edu_career_ug);
    setDatapg(widget.edu_career_pg);
    setDatasslc(widget.edu_career_sslc);
    setDatahsc(widget.edu_career_hsc);
    pickedDate = DateTime.now();
  }

  setDatasslc(var ss) {
    s.sslc_board.text = ss['sslc_board'];
    s.sslc_marks.text = ss['sslc_marks'];
    s.sslc_proof.text = ss['sslc_proof'];
    s.sslc_school_name.text = ss['sslc_school_name'];
    s.sslc_yop.text = ss['sslc_yop'];
  }

  setDatahsc(var hs) {
    h.hsc_board.text = hs['hsc_board'];
    h.hsc_marks.text = hs['hsc_marks'];
    h.hsc_proof.text = hs['hsc_proof'];
    h.hsc_school_name.text = hs['hsc_school_name'];
    h.hsc_yop.text = hs['hsc_yop'];
  }

  setDataug(var ug) {
    u.ug_degree.text = ug['ug_degree'];

    u.ug_institution_name.text = ug['ug_institution_name'];

    u.ug_major_subject.text = ug['ug_major_subject'];

    u.ug_marks.text = ug['ug_marks'];

    u.ug_proof.text = ug['ug_proof'];

    u.ug_university.text = ug['ug_university'];

    u.ug_yop.text = ug['ug_yop'];
  }

  setDatapg(var pg) {
    p.pg_degree.text = pg['pg_degree'];

    p.pg_institution_name.text = pg['pg_institution_name'];

    p.pg_major_subject.text = pg['pg_major_subject'];

    p.pg_marks.text = pg['pg_marks'];

    p.pg_proof.text = pg['pg_proof'];

    p.pg_university.text = pg['pg_university'];

    p.pg_yop.text = pg['pg_yop'];
  }

  @override
  Widget build(BuildContext context) {
    ht = MediaQuery.of(context).size.height;
    wt = MediaQuery.of(context).size.width;

    return MaterialApp(
        title: "Tech - HR",
        debugShowCheckedModeBanner: false,
        color: Colors.white,
        home: Scaffold(
            body: SingleChildScrollView(
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
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Text(
                        "CANCEL",
                        style: TextStyle(
                            fontSize: wt / 20,
                            color: Colors.blueGrey[600],
                            fontWeight: FontWeight.w500),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                            fontSize: wt / 20,
                            color: materialColor,
                            fontWeight: FontWeight.w500),
                      ),
                      onTap: () {
                        // _savedData();
                        /*  notilist.add(
                            "Your information in Personal Info has been changed");
                        print("saved");*/
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ]),
          ),
          Card(
              color: Colors.white,
              child: Container(
                width: wt,
                padding: EdgeInsets.all(9.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(9.0), child: _buildHead()),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "SSLC :",
                        style: lst.copyWith(fontSize: wt / 25),
                      ),
                    ),
                    SizedBox(height: 2),
                    combo("Board", s.sslc_board, 1),
                    SizedBox(height: 2),
                    combo("Marks", s.sslc_marks, 2),
                    SizedBox(height: 2),
                    combo("Proof", s.sslc_proof, 3),
                    SizedBox(height: 2),
                    combo("School Name", s.sslc_school_name, 4),
                    SizedBox(height: 2),
                    combo("Yop", s.sslc_yop, 5),
                    SizedBox(height: 6),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "HSC :",
                        style: lst.copyWith(fontSize: wt / 25),
                      ),
                    ),
                    SizedBox(height: 2),
                    combo("Board", h.hsc_board, 1),
                    SizedBox(height: 2),
                    combo("Marks", h.hsc_marks, 2),
                    SizedBox(height: 2),
                    combo("Proof", h.hsc_proof, 3),
                    SizedBox(height: 2),
                    combo("School Name", h.hsc_school_name, 4),
                    SizedBox(height: 2),
                    combo("Yop", h.hsc_yop, 5),
                    SizedBox(height: 6),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "UG :",
                        style: lst.copyWith(fontSize: wt / 25),
                      ),
                    ),
                    SizedBox(height: 2),
                    combo("Degree", u.ug_degree, 1),
                    SizedBox(height: 2),
                    combo("Insititution Name", u.ug_institution_name, 2),
                    SizedBox(height: 2),
                    combo("Major Subject", u.ug_major_subject, 3),
                    SizedBox(height: 2),
                    combo("Marks", u.ug_marks, 4),
                    SizedBox(height: 2),
                    combo("Proof", u.ug_proof, 5),
                    SizedBox(height: 2),
                    combo("University", u.ug_university, 6),
                    SizedBox(height: 2),
                    combo("YOP", u.ug_yop, 7),
                    SizedBox(height: 6),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "PG :",
                        style: lst.copyWith(fontSize: wt / 25),
                      ),
                    ),
                    SizedBox(height: 2),
                    combo("Degree", p.pg_degree, 1),
                    SizedBox(height: 2),
                    combo("Insititution Name", p.pg_institution_name, 2),
                    SizedBox(height: 2),
                    combo("Major Subject", p.pg_major_subject, 3),
                    SizedBox(height: 2),
                    combo("Marks", p.pg_marks, 4),
                    SizedBox(height: 2),
                    combo("Proof", p.pg_proof, 5),
                    SizedBox(height: 2),
                    combo("University", p.pg_university, 6),
                    SizedBox(height: 2),
                    combo("YOP", p.pg_yop, 7),
                    SizedBox(height: 6),
                  ],
                ),
              ))
        ]))));
  }

  Widget chooseNationalDropBox(String label) {
    return Container(
        padding: EdgeInsets.all(4.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildLabel(label),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                color: Colors.grey[100],
                child: Center(
                  child: DropdownButton(
                    iconEnabledColor: materialColor,
                    iconDisabledColor: materialColor,
                    underline: SizedBox(height: 5),
                    hint: _dropDownNationalValue == null
                        ? Center(
                            child: Text(
                            "Select Nationality",
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: Colors.blueGrey[300],
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          ))
                        : Center(
                            child: Text(
                            _dropDownNationalValue,
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: fontColor,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          )),
                    isExpanded: true,
                    iconSize: 28.0,
                    style: TextStyle(
                        fontSize: wt / 30,
                        color: Colors.black,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600),
                    isDense: false,
                    items: nationallist.map(
                      (val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(
                            val,
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: fontColor,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          ),
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(
                        () {
                          _dropDownNationalValue = val;
                          national = val;
                        },
                      );
                    },
                  ),
                ),
              )
            ]));
  }

  Widget chooseGenderDropBox(String label) {
    return Container(
        padding: EdgeInsets.all(4.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildLabel(label),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                color: Colors.grey[100],
                child: Center(
                  child: DropdownButton(
                    iconEnabledColor: materialColor,
                    iconDisabledColor: materialColor,
                    underline: SizedBox(height: 0.8),
                    hint: _dropDownGenderValue == null
                        ? Center(
                            child: Text(
                            "Select Gender",
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: Colors.blueGrey[300],
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          ))
                        : Center(
                            child: Text(
                            _dropDownGenderValue,
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: fontColor,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          )),
                    isExpanded: true,
                    iconSize: 28.0,
                    style: TextStyle(
                        fontSize: wt / 30,
                        color: Colors.black,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600),
                    isDense: false,
                    items: genderlist.map(
                      (val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(
                            val,
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: fontColor,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          ),
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(
                        () {
                          _dropDownGenderValue = val;
                          gender = val;
                        },
                      );
                    },
                  ),
                ),
              )
            ]));
  }

  Widget chooseMaritalDropBox(String label) {
    return Container(
        padding: EdgeInsets.all(4.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildLabel(label),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                color: Colors.grey[100],
                child: Center(
                  child: DropdownButton(
                    iconEnabledColor: materialColor,
                    iconDisabledColor: materialColor,
                    underline: SizedBox(height: 0.8),
                    hint: _dropDownMaritalValue == null
                        ? Center(
                            child: Text(
                            "Select Marital Status",
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: Colors.blueGrey[300],
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          ))
                        : Center(
                            child: Text(
                            _dropDownMaritalValue,
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: fontColor,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          )),
                    isExpanded: true,
                    iconSize: 28.0,
                    style: TextStyle(
                        fontSize: wt / 30,
                        color: Colors.black,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600),
                    isDense: false,
                    items: maritallist.map(
                      (val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(
                            val,
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: fontColor,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          ),
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(
                        () {
                          _dropDownMaritalValue = val;
                          marital = val;
                        },
                      );
                    },
                  ),
                ),
              )
            ]));
  }

  Widget dobField(String label, int i) {
    return Container(
        padding: EdgeInsets.all(4.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildLabel(label),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  color: Colors.grey[100],
                  child: Center(
                      child: ListTile(
                    title: Center(
                      child: Text(
                        "${pickedDate.day} ${months[pickedDate.month - 1]} ${pickedDate.year}",
                        style: TextStyle(
                            fontSize: wt / 26,
                            height: 1,
                            color: fontColor,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    trailing: Icon(
                      Icons.date_range,
                      size: 20,
                      color: materialColor,
                    ),
                    onTap: _pickDate,
                  )))
            ]));
  }

  Widget combo(String label, TextEditingController t, int i) {
    return Container(
        padding: EdgeInsets.all(4.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildLabel(label),
              _buildField(t, i),
            ]));
  }

  _savedData() {
    print("Current saved Data is:\n" +
        fullname +
        "\n" +
        dob +
        "\n" +
        national +
        "\n" +
        emailadd +
        "\n" +
        phnno +
        "\n" +
        gender +
        "\n" +
        marital +
        "\n" +
        personaltax +
        "\n" +
        socialinsurane +
        "\n" +
        healthinsurance);
    setState(() {
      /*i.fullNameC.text = fullname;
      //  i.dobC.text = dob;
      // i.nationalityC.text = national;
      i.emailC.text = emailadd;
      i.phnnoC.text = phnno;
      //  i.genderC.text = gender;
      //  i.maritalC.text = marital;
      i.personaltax.text = personaltax;
      i.socialInsurance.text = socialinsurane;
      i.healthInsurance.text = healthinsurance;*/

      //print("controller:" + i.fullNameC.text + "and" + fullname);
    });
  }

  Widget _buildHead() {
    return Text(
      "Personal Info",
      style: hst.copyWith(fontSize: wt / 19),
    );
  }

  Widget _buildLabel(String label) {
    return Text(label, style: lst.copyWith(fontSize: wt / 25));
  }

  Widget _buildField(TextEditingController c, int index) {
    if (c.text == "") {
      setState(() {
        c.text = " Nil ";
      });
    }
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      color: Colors.grey[100],
      child: Center(
        child: TextFormField(
          controller: c,
          showCursor: true,
          cursorColor: materialColor,
          cursorWidth: 1,
          onChanged: (value) {
            setState(() {
              print("After changed" + c.text);
              if (index == 1) {
                fullname = value;
              } else if (index == 2) {
                dob = value;
              } else if (index == 3) {
                national = value;
              } else if (index == 4) {
                emailadd = value;
              } else if (index == 5) {
                phnno = value;
              } else if (index == 6) {
                gender = value;
              } else if (index == 7) {
                marital = value;
              } else if (index == 8) {
                personaltax = value;
              } else if (index == 9) {
                socialinsurane = value;
              } else if (index == 10) {
                healthinsurance = value;
              }
              // = value;
            });
          },
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: wt / 26,
              height: 1,
              color: fontColor,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.edit,
              size: 22,
              color: materialColor,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: pickedDate,
    );
    if (date != null)
      setState(() {
        pickedDate = date;
      });
  }
}

class SslcData {
  TextEditingController sslc_board = new TextEditingController();
  TextEditingController sslc_marks = new TextEditingController();
  TextEditingController sslc_proof = new TextEditingController();
  TextEditingController sslc_school_name = new TextEditingController();
  TextEditingController sslc_yop = new TextEditingController();
}

class HscData {
  TextEditingController hsc_board = new TextEditingController();
  TextEditingController hsc_marks = new TextEditingController();
  TextEditingController hsc_proof = new TextEditingController();
  TextEditingController hsc_school_name = new TextEditingController();
  TextEditingController hsc_yop = new TextEditingController();
}

class UgData {
  TextEditingController ug_degree = new TextEditingController();
  TextEditingController ug_institution_name = new TextEditingController();
  TextEditingController ug_major_subject = new TextEditingController();
  TextEditingController ug_marks = new TextEditingController();
  TextEditingController ug_proof = new TextEditingController();
  TextEditingController ug_university = new TextEditingController();

  TextEditingController ug_yop = new TextEditingController();
}

class PgData {
  TextEditingController pg_degree = new TextEditingController();
  TextEditingController pg_institution_name = new TextEditingController();
  TextEditingController pg_major_subject = new TextEditingController();
  TextEditingController pg_marks = new TextEditingController();
  TextEditingController pg_proof = new TextEditingController();
  TextEditingController pg_university = new TextEditingController();

  TextEditingController pg_yop = new TextEditingController();
}
