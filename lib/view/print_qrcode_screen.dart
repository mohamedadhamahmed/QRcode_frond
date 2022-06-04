import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:typed_data';
import 'dart:html' as html;

import '../model/get_and_create_qrcode_and_delete.dart';
import '../model/get_and_create_user.dart';
import '../model/get_and_create_visitor.dart';
import '../view_model/qrcode.dart';
import '../view_model/vistor.dart';
import 'admin_home_screen.dart';
import 'home_screen.dart';

List<List<String>> user_data = [
];

class PDFSave extends StatefulWidget {
  static String id = 'PDFSave';
  @override
  _PDFSaveState createState() => _PDFSaveState();
}

class _PDFSaveState extends State<PDFSave> {
  String name = "....";
  String visit_reason = "....";
  String nameofoffcer = "....";
  String phone_number = "....";
  String place = "....";
  String creator = "....";
  String department = "...";
  int national_number;
  String unit = '';
  bool isloading = true;
  var user;
  final pdf = pw.Document();
  var anchor;
  savePDF() async {
    print('hi3');

    Uint8List pdfInBytes = await pdf.save();
    final blob = html.Blob([pdfInBytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'pdf.pdf';
    html.document.body.children.add(anchor);
  }

  createPDF(String id_qrcode) async {
    print('hi2');

    var data = await rootBundle.load("fonts/HacenTunisia.ttf");
    var myFont = pw.Font.ttf(data);

    //var arabicFont = pw.Font.ttf(await rootBundle.load("images/arial.ttf"));
    String test = 'المعهد الفنى للقوات المسلحة';
    // final imageA = pw.MemoryImage(
    //   (await rootBundle.load('images/Pdf_Succinctly.jpg')).buffer.asUint8List(),
    // );

    var assetImage = pw.MemoryImage(
      (await rootBundle.load('logo2.png')).buffer.asUint8List(),
    );
    pdf.addPage(pw.MultiPage(
        theme: pw.ThemeData.withFont(
          base: myFont,

        ),

        build: (pw.Context context) => [
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Container(height: 50, child: pw.Image(assetImage)),
                    pw.Column(children: [
                      pw.Text('هيئة التسليح للقوات المسلحة',
                          style: pw.TextStyle(fontSize: 17, font: myFont),
                          textDirection: pw.TextDirection.rtl),
                      pw.Text(test,
                          style: pw.TextStyle(fontSize: 17, font: myFont),
                          textDirection: pw.TextDirection.rtl),
                    ])
                  ]),

              pw.SizedBox(height: 40),

              // pw.Container(
              //   child: pw.Directionality(
              //     textDirection: pw.TextDirection.rtl,
              //     child: pw.Table.fromTextArray(
              //         headerStyle: pw.TextStyle(
              //           fontSize: 15,
              //
              //         ),
              //        headers: <dynamic>['العنوان', 'رقم التلفون' ,'الرقم القومى', 'اسم'],
              //         cellAlignment: pw.Alignment.center,
              //         cellStyle: pw.TextStyle(
              //             fontSize: 10
              //         ),
              //         data: user_data
              //     ),
              //   ),
              // ),
              pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                  children: [
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.end,
                        children: [
                          pw.Text(user_data[0][1],
                              style: pw.TextStyle(fontSize: 13, font: myFont),
                              textDirection: pw.TextDirection.rtl),
                          pw.Text(user_data[0][0],
                              style: pw.TextStyle(fontSize: 13, font: myFont),
                              textDirection: pw.TextDirection.rtl),
                        ]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.end,
                        children: [
                          pw.Text(user_data[1][1],
                              style: pw.TextStyle(fontSize: 13, font: myFont),
                              textDirection: pw.TextDirection.rtl),
                          pw.Text(user_data[1][0],
                              style: pw.TextStyle(fontSize: 13, font: myFont),
                              textDirection: pw.TextDirection.rtl),
                        ]),
                    // pw.Row(
                    //     mainAxisAlignment: pw.MainAxisAlignment.end,
                    //     children: [
                    //       pw.Text(user_data[2][1],
                    //           style: pw.TextStyle(fontSize: 18, font: myFont),
                    //           textDirection: pw.TextDirection.rtl),
                    //       pw.Text(user_data[2][0],
                    //           style: pw.TextStyle(fontSize: 18, font: myFont),
                    //           textDirection: pw.TextDirection.rtl),
                    //     ]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.end,
                        children: [
                          pw.Text(user_data[3][1],
                              style: pw.TextStyle(fontSize: 13, font: myFont),
                              textDirection: pw.TextDirection.rtl),
                          pw.Text(user_data[3][0],
                              style: pw.TextStyle(fontSize: 13, font: myFont),
                              textDirection: pw.TextDirection.rtl),
                        ]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.end,
                        children: [
                          pw.Text(user_data[4][1],
                              style: pw.TextStyle(fontSize: 13, font: myFont),
                              textDirection: pw.TextDirection.rtl),
                          pw.Text(user_data[4][0],
                              style: pw.TextStyle(fontSize: 13, font: myFont),
                              textDirection: pw.TextDirection.rtl),
                        ]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.end,
                        children: [
                          pw.Text(user_data[5][1],
                              style: pw.TextStyle(fontSize: 13, font: myFont),
                              textDirection: pw.TextDirection.rtl),
                          pw.Text(user_data[5][0],
                              style: pw.TextStyle(fontSize: 13, font: myFont),
                              textDirection: pw.TextDirection.rtl),
                        ]),
                  ]),
              pw.SizedBox(height: 50),

              pw.Container(
                width: 150,
                height: 150,
                child: pw.BarcodeWidget(
                  // width: width*0.15,
                  // height: height*0.2,
                  barcode: pw.Barcode.qrCode(),
                  // color: Colors.white,
                  data: id_qrcode,
                ),
              ),

              // pw.Text(test,
              //     style: pw.TextStyle(fontSize: 30, font: myFont),
              //     textDirection: pw.TextDirection.rtl),
              pw.SizedBox(height: 30),

              pw.Container(
                  child: pw.Row(children: [
                pw.SizedBox(width: 220),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Text('الاســــم:  ',
                        style: pw.TextStyle(fontSize: 20, font: myFont),
                        textDirection: pw.TextDirection.rtl),
                    pw.Text('التـوقيـع:',
                        style: pw.TextStyle(fontSize: 20, font: myFont),
                        textDirection: pw.TextDirection.rtl),
                    pw.Text('رئيــــــــس فـــــــرع النــــــظم المعلومات',
                        style: pw.TextStyle(fontSize: 20, font: myFont),
                        textDirection: pw.TextDirection.rtl),
                  ],
                )
              ]))
            ]));

    savePDF();
  }

  @override
  void initState() {
    super.initState();
     getdata();
    print('print qrcode');

  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    getdata();
    print('print qrcode');
    // if (arguments != null) {
    //   //'id': search_id_contriller.text,'name':textVisitorName.text,'visitreason':visitreason_s,
    //   // 'text_please_name':text_please_name,'creator':creator
    //   id_qrcode = arguments['id'];
    //
    //   print("id qrcode " + id_qrcode);
    //   createPDF(id_qrcode);
    //   //   getdata(id);
    //   // get_officer("61d08a6b6a90efcba985100c");
    //
    // }
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('PDF Creator'),
        ),
        body: isloading == true
            ? Center(
                child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
                color: Colors.white,
              ))
            : Center(
                child: RaisedButton(
                child: Text('Press'),
                onPressed: () async {
                  setState(() {
                    isloading=true;
                  });
                  print('hi');
                  final prefs = await SharedPreferences.getInstance();
                  final List<String> current_user =await prefs.getStringList('user_data');

                  print(current_user.length);
                  print(current_user[3]);
                  if (current_user != null && current_user[3] == 'true') {

                    anchor.click();
                    Navigator.pushReplacementNamed(context, Admin_Home_Screen.id);

                  }
                 else {
                    Navigator.pushReplacementNamed(context, Home_Screen.id);
                  }
                },
              )));
  }

  getdata() async {
    final prefs = await SharedPreferences.getInstance();
    final String id =await prefs.getString('id_qrcode');
    createPDF(id);
    print('qrcode id is ->>>>'+id);
    QRcode qrcode_data;
    if (id != null) {
      print('id for print qrcode is'+id);
      qrcode_data = await Get_And_Create_Qrcode().get_Qrcode(id);
      print(qrcode_data.visitor);
    }

    setState(() {
      print("hiiii");
      visit_reason = qrcode_data.visitReason;
      place = qrcode_data.place;
      creator = qrcode_data.creator;
    });
    print('create qrcode data :-');
    await getVisitor(qrcode_data.visitor);
    await get_Officer(qrcode_data.creator);

    user_data=  [
      ['الاسم : ', name],
      ["الرقم القومى : ",national_number.toString()],
      ['العنوان  : ', 'القاهرة'],
      ['الرقم التليفون : ', phone_number],
      ["السبب من الزيارة : ",visit_reason.toString()],
      ["مكان الزيارة : ", place],
      ['شركة  : ', unit],
    ];
    setState(() {
      isloading = false;
    });
    return qrcode_data;
  }

  getVisitor(id) async {
    print('create qrcode visitor data :-');

    Visitor visitor_data = await Get_And_Create_Visitor().fetchvisitor(id);

    // setState(() {
    //   print("hiiii");
    //   visit_reason=qrcode_data.visitReason;
    //   place=qrcode_data.place;
    //   creator=qrcode_data.creator;
    //
    // });
    setState(() {
      name = visitor_data.name;
      national_number = visitor_data.national_number;
      phone_number = visitor_data.phone_number;
      unit = visitor_data.unit;
    });

    print(visitor_data.name);
    print(visitor_data.degree);
    print(visitor_data.national_number);
    print(visitor_data.phone_number);

    return visitor_data;
  }

  get_Officer(var id) async {
    print('create qrcode officier  data :-');

    var user = await Get_And_Create_User().get_user(id);
    setState(() {
      // name=user.name;
      // phone_number=user.phone_number;
      // department=user.department;
    });
    print(user.name);
    print(user.phone_number);
    print(user.department);
    print(user.email);
    print(user.degree);
    return user;
  }
}
