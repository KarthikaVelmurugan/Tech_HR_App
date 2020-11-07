import 'package:flutter/material.dart';
import 'package:techhr/styles/styles.dart';
import 'package:techhr/view/screens/dashboard/profile/profileinfo.dart';

class EditingPage extends StatefulWidget {
  var personal_details;
  EditingPage({this.personal_details});
  @override
  _EditingPage createState() => _EditingPage();
}

class _EditingPage extends State<EditingPage> {
  String _dropDownNationalValue, _dropDownMaritalValue, _dropDownGenderValue;
  DateTime pickedDate;
  PersonalInfo d = new PersonalInfo();
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
  InfoData i = new InfoData();
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
    setData(widget.personal_details);
    pickedDate = DateTime.now();
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
                    combo("Aadhar Name", i.adhaar_name, 1),
                    SizedBox(height: 2),
                    combo("Aadhar Number", i.adhaar_number, 2),
                    SizedBox(height: 2),
                    combo("Aadhar Proof", i.adhaar_proof, 3),
                    SizedBox(height: 2),
                    combo("Bank A/C Number", i.bank_ac_number, 4),
                    SizedBox(height: 2),
                    combo("Bank branch", i.bank_branch, 5),
                    SizedBox(height: 2),
                    combo("Bank IFSC", i.bank_ifsc, 6),
                    SizedBox(height: 2),
                    combo("Bank Name", i.bank_name, 7),
                    SizedBox(height: 2),
                    combo("Bank Proof", i.bank_proof, 8),
                    SizedBox(height: 2),
                    combo("Blood Group", i.blood_group, 9),
                    SizedBox(height: 2),
                    // combo("Date Of Birth", i.dob, 10),
                    dobField("Date of Birth", 10),
                    SizedBox(height: 2),
                    combo("Employee ID", i.employee_id, 11),
                    SizedBox(height: 2),
                    combo("Father DOB", i.father_dob, 12),
                    SizedBox(height: 2),
                    combo("Father Mobile No", i.father_mobile, 13),
                    SizedBox(height: 2),
                    combo("Father Name", i.father_name, 14),
                    SizedBox(height: 2),
                    combo("First Name", i.first_name, 15),
                    SizedBox(height: 2),
                    // combo("Gender", i.gender, 16),
                    chooseGenderDropBox("Gender"),
                    SizedBox(height: 2),
                    combo("ID Expiry", i.id_expiry, 17),
                    SizedBox(height: 2),
                    combo("ID Name", i.id_name, 18),
                    SizedBox(height: 2),
                    combo("ID Number", i.id_number, 19),
                    SizedBox(height: 2),
                    combo("ID Proof", i.id_proof, 20),
                    SizedBox(height: 2),
                    combo(
                        "International Employee", i.international_employee, 21),
                    SizedBox(height: 2),
                    combo("Last Name", i.last_name, 22),
                    SizedBox(height: 2),
                    combo("Maritial Status", i.maritial_status, 23),
                    SizedBox(height: 2),
                    combo("Marriage Date", i.marriage_date, 24),
                    SizedBox(height: 2),
                    combo("Mobile", i.mobile, 25),
                    SizedBox(height: 2),
                    dobField("Mother DOB", 26),
                    //  combo("Mother DOB", i.mother_dob, 26),
                    SizedBox(height: 2),
                    combo("Mother Mobile No", i.mother_mobile, 27),
                    SizedBox(height: 2),
                    combo("Mother Name", i.mother_name, 28),
                    SizedBox(height: 2),
                    chooseNationalDropBox("Nationality"),
                    // combo("Nationality", i.nationality, 29),
                    SizedBox(height: 2),
                    combo("Official Email", i.official_email, 30),
                    SizedBox(height: 2),
                    combo("Official Mobile Number", i.official_mobile, 31),
                    combo("PAN No", i.pan_number, 32),
                    SizedBox(height: 2),
                    combo("PAN Proof", i.pan_proof, 33),
                    SizedBox(height: 2),
                    combo("Personal Email", i.personal_email, 34),
                    SizedBox(height: 2),
                    combo("Personal Mobile", i.personal_mobile, 35),
                    SizedBox(height: 2),
                    combo("Specially Disabled", i.specially_disabled, 36),
                    SizedBox(height: 2),
                    dobField("Spouse DOB", 37),
                    // combo("Spouse DOB", i.spouse_dob, 37),
                    SizedBox(height: 2),
                    combo("Spouse Mobile", i.spouse_mobile, 38),
                    SizedBox(height: 2),
                    combo("Spouse Name", i.spouse_name, 39),
                    SizedBox(height: 2),
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
