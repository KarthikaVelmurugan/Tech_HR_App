import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techhr/styles/styles.dart';

class AddressDetails extends StatefulWidget {
  var temporary_address;
  var permanent_address;
  AddressDetails({this.permanent_address, this.temporary_address});
  @override
  _AddressDetails createState() => _AddressDetails();
}

class _AddressDetails extends State<AddressDetails> {
  double ht, wt;
  var hst = TextStyle(
      color: fontColor, letterSpacing: 0.5, fontWeight: FontWeight.w700);

  var lst = TextStyle(
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: Colors.blueGrey[400]);

  @override
  void initState() {
    print(widget.temporary_address['city']);

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(9.0), child: _buildHead()),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Tap to View Your full Address",
                      style: lst.copyWith(fontSize: wt / 27),
                    )),
                SizedBox(height: wt / 5),
                Center(
                    child: _buildAddressCard(
                        "permanent Address",
                        widget.permanent_address['building_name'] == 'Nil'
                            ? " - "
                            : "" +
                                widget.permanent_address['building_name'] +
                                "," +
                                widget.permanent_address['area'] +
                                "\n" +
                                widget.permanent_address['city'] +
                                "," +
                                widget.permanent_address['district'] +
                                "\n" +
                                widget.permanent_address['state'] +
                                "," +
                                widget.permanent_address['country'] +
                                "."
                                    "\n" +
                                "" +
                                widget.permanent_address['pincode'])),
                SizedBox(height: wt / 9),
                Center(
                    child: _buildAddressCard(
                        "Temperory Address",
                        widget.temporary_address['building_name'] == 'Nil'
                            ? " - "
                            : "" +
                                widget.temporary_address['building_name'] +
                                "," +
                                widget.temporary_address['area'] +
                                "\n" +
                                widget.temporary_address['city'] +
                                "," +
                                widget.temporary_address['district'] +
                                "\n" +
                                widget.temporary_address['state'] +
                                "," +
                                widget.temporary_address['country'] +
                                "."
                                    "\n" +
                                widget.temporary_address['pincode'])),
              ],
            ),
          )
        ])))));
  }

  Widget _buildAddressCard(String title, String add) {
    return Container(
        // height: wt / 4,
        child: Card(
            elevation: 20,
            shadowColor: Colors.deepPurple[400],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: ExpansionCard(
              initiallyExpanded: true,
              borderRadius: 20,
              title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(title, style: hst.copyWith(fontSize: wt / 26)),
                  ]),
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(add, style: lst.copyWith(fontSize: wt / 28)))
              ],
            )));
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
      "Address Details",
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
