import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techhr/styles/styles.dart';

class SalaryDetails extends StatefulWidget {
  @override
  _SalaryDetails createState() => _SalaryDetails();
}

class _SalaryDetails extends State<SalaryDetails> {
  double ht, wt;
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
                  //_buildCard("Basic"),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: _buildSalary("Basic")),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: _buildSalary("conveyance")),
                  Padding(
                      padding: EdgeInsets.all(8.0), child: _buildSalary("ctc")),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: _buildSalary("deduction")),
                  Padding(
                      padding: EdgeInsets.all(8.0), child: _buildSalary("epf")),
                  Padding(
                      padding: EdgeInsets.all(8.0), child: _buildSalary("esi")),
                  Padding(
                      padding: EdgeInsets.all(8.0), child: _buildSalary("HRA")),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: _buildSalary("variable_pay")),
                ]),
          )
        ])))));
  }

  Widget _buildSalary(String title) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 15,
        shadowColor: Colors.deepPurple[400],
        child: ListTile(
            title: Text(
          title,
          style: hst.copyWith(
            fontSize: wt / 28,
          ),
        )),
      ),
      actions: <Widget>[
        IconSlideAction(
            caption: "Rate \n 50 | P",
            foregroundColor: Colors.white,
            color: materialColor,
            icon: Icons.more_horiz,
            onTap: null),
        IconSlideAction(
            caption: "Monthly\n 12500.00",
            foregroundColor: materialColor,
            color: Colors.white,
            icon: Icons.more_horiz,
            onTap: null),
        IconSlideAction(
            caption: "Yearly \n 150000.00",
            foregroundColor: Colors.white,
            color: materialColor,
            icon: Icons.more_horiz,
            onTap: null),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
            caption: "Rate \n 50 | P",
            foregroundColor: Colors.white,
            color: materialColor,
            icon: Icons.more_horiz,
            onTap: null),
        IconSlideAction(
            caption: "Monthly\n 12500.00",
            foregroundColor: materialColor,
            color: Colors.white,
            icon: Icons.more_horiz,
            onTap: null),
        IconSlideAction(
            caption: "Yearly \n 150000.00",
            foregroundColor: Colors.white,
            color: materialColor,
            icon: Icons.more_horiz,
            onTap: null),
      ],
    );
  }

  Widget _buildCard(String title) {
    return Padding(
        padding: EdgeInsets.all(3.0),
        child: Card(
            elevation: 20,
            shadowColor: Colors.deepPurple[400],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: ExpansionCard(
              backgroundColor: Colors.white,
              title: Text(
                title,
                style: hst.copyWith(fontSize: wt / 28),
                textAlign: TextAlign.center,
              ),
              borderRadius: 15,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text("monthly",
                                style: lst.copyWith(fontSize: wt / 30)),
                            Text("name",
                                style: lst.copyWith(fontSize: wt / 30)),
                            Text("rate",
                                style: lst.copyWith(fontSize: wt / 30)),
                            Text("yearly",
                                style: lst.copyWith(fontSize: wt / 30))
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text("12500.0",
                                style: hst.copyWith(fontSize: wt / 30)),
                            Text("Basic",
                                style: lst.copyWith(fontSize: wt / 30)),
                            Text("", style: lst.copyWith(fontSize: wt / 30)),
                            Text("yearly",
                                style: lst.copyWith(fontSize: wt / 30))
                          ],
                        )
                      ],
                    ))
              ],
            )));
  }

  Widget _buildHead() {
    return Text(
      "Salary Details",
      style: hst.copyWith(fontSize: wt / 20),
    );
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
