import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techhr/styles/styles.dart';

class PersonalInfo extends StatefulWidget {
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

  @override
  void initState() {
    //   i.data();
    print("Data is" + i.fullNameC.text);
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
                combo("Full Name", i.fullNameC),
                SizedBox(height: 2),
                combo("Date of Birth", i.dobC),
                SizedBox(height: 2),
                combo("Nationality", i.nationalityC),
                SizedBox(height: 2),
                combo("Email Address", i.emailC),
                SizedBox(height: 2),
                combo("Phone Number", i.phnnoC),
                SizedBox(height: 2),
                combo("Gender", i.genderC),
                SizedBox(height: 2),
                combo("Marital Status", i.maritalC),
                SizedBox(height: 2),
                combo("Personal Tax ID", i.personaltax),
                SizedBox(height: 2),
                combo("Social Insurance", i.socialInsurance),
                SizedBox(height: 2),
                combo("Health Insurance", i.healthInsurance),
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
    return Container(
        margin: new EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
        child: Card(
          elevation: 15,
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

class InfoData {
  //personal Info
  TextEditingController fullNameC = new TextEditingController();
  // String dobC;
  TextEditingController dobC = new TextEditingController();
  //String nationalityC;
  TextEditingController nationalityC = new TextEditingController();
  TextEditingController emailC = new TextEditingController();
  TextEditingController phnnoC = new TextEditingController();
  // String genderC;
  TextEditingController genderC = new TextEditingController();
  // String maritalC;
  TextEditingController maritalC = new TextEditingController();
  TextEditingController personaltax = new TextEditingController();
  TextEditingController socialInsurance = new TextEditingController();
  TextEditingController healthInsurance = new TextEditingController();
  //Home address info
  TextEditingController fullAddressC = new TextEditingController();
  TextEditingController postalcodeC = new TextEditingController();
  TextEditingController countryC = new TextEditingController();
  TextEditingController stateC = new TextEditingController();
  TextEditingController cityC = new TextEditingController();
  //String countryC;
  //String stateC;
  //String cityC;
  //Emergency contact
  TextEditingController relationshipC = new TextEditingController();

  //Job info
  TextEditingController employeeStatusC = new TextEditingController();
  TextEditingController joinDateC = new TextEditingController();
  TextEditingController jobtitleC = new TextEditingController();
  TextEditingController departmentC = new TextEditingController();
  TextEditingController officeC = new TextEditingController();
  TextEditingController lineManagerC = new TextEditingController();
  TextEditingController employmentTypeC = new TextEditingController();
  TextEditingController probationstartdateC = new TextEditingController();
  TextEditingController probationenddateC = new TextEditingController();
  TextEditingController contractstartdateC = new TextEditingController();
  TextEditingController contractenddateC = new TextEditingController();
  //Dependents
  TextEditingController dfname = new TextEditingController();
  TextEditingController dlname = new TextEditingController();
  TextEditingController ddob = new TextEditingController();
  TextEditingController dnational = new TextEditingController();
  TextEditingController dgender = new TextEditingController();
  TextEditingController drelation = new TextEditingController();
  TextEditingController dcity = new TextEditingController();
  TextEditingController ddistrict = new TextEditingController();
  TextEditingController dpersonalid = new TextEditingController();
  TextEditingController dpersonaltax = new TextEditingController();
  TextEditingController des = new TextEditingController();
  TextEditingController ded = new TextEditingController();

  InfoData() {
    fullNameC.text = "Karthika Velmurugan";
    dobC.text = "13 Feb 2000";
    nationalityC.text = "-";
    emailC.text = "karthikavel2000@gmail.com";
    phnnoC.text = "+919080517780";
    genderC.text = "Female";
    maritalC.text = "-";
    personaltax.text = "-";
    socialInsurance.text = "-";
    healthInsurance.text = "-";
    //Home data
    fullAddressC.text = "-";
    postalcodeC.text = '-';
    countryC.text = '-';
    stateC.text = '-';
    cityC.text = '-';
    //emergency contact
    relationshipC.text = '-';

    //job info

    employeeStatusC.text = "Onboarding";
    joinDateC.text = "03 Sep 2020";
    jobtitleC.text = "Others";
    departmentC.text = "Tailermade";
    officeC.text = "Tailermade";
    lineManagerC.text = "-";
    employmentTypeC.text = "Full-time";
    probationstartdateC.text = "-";
    probationenddateC.text = "-";
    contractstartdateC.text = "-";
    contractenddateC.text = "-";
  }
}
