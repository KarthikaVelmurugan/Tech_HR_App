import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:techhr/styles/styles.dart';
import 'package:techhr/view/screens/backgroundsplash.dart';

class PaySlips extends StatefulWidget {
  @override
  _PaySlips createState() => _PaySlips();
}

class _PaySlips extends State<PaySlips> {
  DateTime initialDate;
  double ht, wt;
  DateTime selectedDate;
  String generatedPdfFilePath;
  String _openResult = 'Unknown';

  @override
  void initState() {
    super.initState();
    initialDate = DateTime.now();
    selectedDate = initialDate;
    // generateExampleDocument();
  }

  Future<void> openFile(String filePath) async {
    final result = await OpenFile.open(filePath);

    setState(() {
      _openResult = "type=${result.type}  message=${result.message}";
    });
  }

  Future<void> generateExampleDocument() async {
    var htmlContent = """
   <!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap5.min.css" />
        <style>
            td{
                font-size: 16px;                
            }
            thead{
                color: antiquewhite;
            }              
            .value{                
                text-align: right;                
            }
            .heading-right{
                font-size: 17px;
                text-align: right;                
            }
            .heading-center{
                font-size: 18px;  
                text-align: center;              
            }
            center{
                font-size: 18px;
            }
            @page {
                size: letter landscape;
                margin: 1cm;
            }
        </style>
        
    </head>
<body>
    <table style="margin-left: 100px; margin-top: 30px; width: 50%;">
        <tr>
            <td><img src="https://i.imgur.com/wxaJsXF.png" alt="web-img"></td>
            <td style="font-size: 18px;"><b>BASS INFRATEL PRIVATE LIMITED <br>No 3, Mary Thozhilagam,3rd Street, Cross Street,Alpha Nagar, RMS Colony,<br>Tiruchirappalli,620001</b></td>
        </tr>
    </table>
    <center><hr style="width: 90%;"></center>
    <center>Annual Salary Statement for the Calender Year of 2020</center>
    <br>
<table id="example" class="table table-bordered table-sm table-striped blue" style="width:90%;margin: auto;">    
    <tbody>
        <thead class="bg-info">
            <td class="heading-center"><b>SALARYHEADS</b></td> 
            {% for i in range(10) %}
            <td class="heading-center"><b>{{i}}</b></td>                
            {% endfor %}
        </thead>
        <tr>
            <td class="heading-center">ALLOWANCES</td> 
            {% for i in range(10) %}
            <td></td>                
            {% endfor %}       
        </tr>
        <tr class="table-info">
            <td>Basic</td>   
            {% for i in range(10) %}
            <td class="value">{{i}}</td>                
            {% endfor %}     
        </tr>
        <tr>
            <td>Conveyance</td>  
            {% for i in range(10) %}
            <td class="value">{{i}}</td>                
            {% endfor %}      
        </tr>
        <tr class="table-info">
            <td>HRA</td>  
            {% for i in range(10) %}
            <td class="value">{{i}}</td>                
            {% endfor %}      
        </tr>
        <tr>
            <td>Variable Pay</td>  
            {% for i in range(10) %}
            <td class="value">{{i}}</td>                
            {% endfor %}      
        </tr>
        <tr class="table-info">
            <td>Bonus</td>
            {% for i in range(10) %}
            <td class="value">{{i}}</td>                
            {% endfor %}
        </tr>
        <tr>
            <td>Incentive</td>
            {% for i in range(10) %}
            <td class="value">{{i}}</td>                
            {% endfor %}
        
        </tr>
        <tr class="table-info">
            <td>Other Salary</td>
            {% for i in range(10) %}
            <td class="value">{{i}}</td>                
            {% endfor %}
        </tr>
        <tr>
            <td>Travel Conveyance</td>
            {% for i in range(10) %}
            <td class="value">{{i}}</td>                
            {% endfor %}
        </tr>
        <tr class="table-info">
            <td class="heading-right"><b>Gross</b></td>
            {% for i in range(10) %}
            <td class="value">{{i}}</td>                
            {% endfor %}
        </tr>
        <tr>
            <td class="heading-center">DEDUCTIONS</td>  
            {% for i in range(10) %}
            <td></td>                
            {% endfor %}              
        </tr>
        <tr class="table-info">
            <td>EPF</td>
            {% for i in range(10) %}
            <td class="value">{{i}}</td>                
            {% endfor %}
        </tr>
        <tr>
            <td>ESI</td>
            {% for i in range(10) %}
            <td class="value">{{i}}</td>                
            {% endfor %}
        
        </tr>
        <tr class="table-info">
            <td>Income Tax</td>
            {% for i in range(10) %}
            <td class="value">{{i}}</td>                
            {% endfor %}
        </tr>
        <tr>
            <td>Others</td>
            {% for i in range(10) %}
            <td class="value">{{i}}</td>                
            {% endfor %}
        </tr>
        <tr class="table-info">
            <td>Salary Advance</td>
            {% for i in range(10) %}
            <td class="value">{{i}}</td>                
            {% endfor %}
        </tr>
        <tr>
            <td class="heading-right"><b>TotalDedu</b></td>
            {% for i in range(10) %}
            <td class="value">{{i}}</td>                
            {% endfor %}
        </tr>
        <tr class="table-info">
            <td class="heading-right"><b>Net Salary</b></td>
            {% for i in range(10) %}
            <td class="value">{{i}}</td>                
            {% endfor %}
        </tr>

    </tbody>
</table>
<br>
<br>
<div style="background-color: blue; width: 90%; margin: auto; color: white;">
    <center>© Powered by BASSPRIS -Online Payroll System</center>
</div>


</body>
</html>
    """;

    Directory appDocDir = await getApplicationDocumentsDirectory();
    var targetPath = appDocDir.path;
    var targetFileName = "payslip-pdf";

    var generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
        htmlContent, targetPath, targetFileName);
    generatedPdfFilePath = generatedPdfFile.path;
    openFile(generatedPdfFilePath);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    wt = screenSize.width;
    ht = screenSize.height;
    String generatedPdfFilePath;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
                height: ht / 2,
                width: wt / 1.5,
                child: SvgPicture.asset(
                  "assets/images/slider3.svg",
                  height: ht / 3,
                )),
            Center(
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "View Payslips",
                    style: hst.copyWith(fontSize: wt / 22),
                  )),
            ),
            Container(
              padding: EdgeInsets.all(6.0),
              child: Text("Select month/year to view your salary report",
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
                      '${selectedDate?.year} / ${selectedDate?.month}',
                      style: hst.copyWith(fontSize: wt / 26),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),

                  onPressed: () => _selectDate(context), // Refer step 3
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Pick Month',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: wt / 28),
                    ),
                  ),
                  color: materialColor,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),

                  onPressed: () {
                    generateExampleDocument();
                  },
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PDFViewerScaffold(
                            // appBar: AppBar(title: Text("Generated PDF Document")),
                            path: generatedPdfFilePath)),*/
                  //download salary pdf
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Download PDF',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: wt / 28),
                    ),
                  ),
                  color: materialColor,
                ),
              ],
            )
          ],
        )));
  }

  _selectDate(BuildContext context) async {
    showMonthPicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1, 5),
      lastDate: DateTime(DateTime.now().year + 1, 9),
      initialDate: selectedDate ?? initialDate,

      //  locale: Locale("es"),
    ).then((date) {
      if (date != null) {
        setState(() {
          selectedDate = date;
        });
      }
    });
  }
}
