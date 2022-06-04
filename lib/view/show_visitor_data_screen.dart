import 'dart:html';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner_example/model/get_and_create_qrcode_and_delete.dart';
import 'package:qr_code_scanner_example/model/get_and_create_user.dart';
import 'package:qr_code_scanner_example/model/get_and_create_visitor.dart';
import 'package:qr_code_scanner_example/view_model/qrcode.dart';
import 'package:qr_code_scanner_example/view_model/user.dart';
import 'package:qr_code_scanner_example/view_model/vistor.dart';
import 'package:qr_code_scanner_example/widgets/custom_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'admin_home_screen.dart';
import 'home_screen.dart';

String natural_number;
Visitor visitor;

class Show_Visitor_Data extends StatefulWidget {
  static String id = "Show_Visitor_Data";

  @override
  _State createState() => _State();
}

class _State extends State<Show_Visitor_Data> {
  String name ="......";
  String unit ="......";
  String phone_number="......";
  String degree ="......";
  String visit_reason="......";
  String visitor_id='';
  String place="......";
  String creator="......";
  String offcer_name="......";
  String offcer_degree="......";
  String offcer_phone_number="......";
  bool  loading= true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_data_visitor();
  }
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    return Scaffold(
        appBar: new PreferredSize(
          child: new Container(
            padding:
                new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: new Row(
              children: [
                IconButton(onPressed: ()async{
                  final prefs =
                      await SharedPreferences.getInstance();
                  final List<String> current_user =
                      await prefs.getStringList('user_data');
                  if (current_user[3] == 'true') {
                    Navigator.pushReplacementNamed(
                        context, Admin_Home_Screen.id);
                  } else {
                    Navigator.pushReplacementNamed(
                        context, Home_Screen.id);
                  }
                }, icon: Icon(Icons.arrow_back,color: Colors.white,))
              ,Padding(
                  padding:
                  const EdgeInsets.only(left: 30.0, top: 20.0, bottom: 20.0),
                  child: new Text(
                    'Show Visitor Data',
                    style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),],

            ),
            decoration: new BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.red, Colors.blue],
                    begin: const FractionalOffset(0.0, 0.4),
                    end: const FractionalOffset(0.5, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.grey[500],
                    blurRadius: 20.0,
                    spreadRadius: 1.0,
                  )
                ]),
          ),
          preferredSize: new Size(MediaQuery.of(context).size.width, 100.0),
        ),
        body: Stack(
          children: [
            Container(
// width: double.infinity,
                height: double.infinity,
                width: double.infinity,
                child: Image(
                  image: AssetImage('1.png'),
                  fit: BoxFit.cover,
                )),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20)),
                  width: width * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: !loading
                        ? ListView(
                            children: [

                              SizedBox(
                                height: height * 0.1,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "Visitor  Date :-    ",
                                      style: new TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),

                                  ],
                                ),
                              ),
                              //
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "Nmae : ",
                                      style: new TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      name,
                                      style: new TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "Unit : ",
                                      style: new TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    Text(

                                      unit
                                      ,
                                      style: new TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                      Container(
                      child: Row(
                      children: [
                      Text(
                  "The reason for the visit : ",
                  style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Text(

                 visit_reason
                  ,
                  style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "Phone Number : ",
                                      style: new TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      phone_number,
                                      style: new TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "Degree : ",
                                      style: new TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      degree,
                                      style: new TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                    SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "place to visit : ",
                          style: new TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Text(
                          place,
                          style: new TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  //
                   SizedBox(
                  height: height * 0.035,
                ),
                Container(
                  child: Row(
                    children: [
                      Text(
                        "Officer Date :-    ",
                        style: new TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),

                    ],
                  ),
                ),
                //
                    SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Officer Name : ",
                          style: new TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Text(
                          offcer_name,
                          style: new TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "Degree : ",
                                      style: new TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      degree,
                                      style: new TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "Phone Number : ",
                                      style: new TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      offcer_phone_number,
                                      style: new TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              )

                            ],
                          )
                        : Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

   get_data_visitor() async {
     final prefs = await SharedPreferences.getInstance();
     String id=prefs.getString('qrcode_id');
    print('get qrcode here');
    await get_data_qrcode(id);
    print('get visitor here');
//get visitor data
     visitor = await Get_And_Create_Visitor().fetchvisitor(visitor_id);
    setState(() {
      name=visitor.name;
      phone_number=visitor.phone_number;
      degree=visitor.degree;
      unit=visitor.unit;
    });
     //get officer data
    get_data_creator(creator);
    print("visitor data :"+visitor.creator);


//update qrcode after one use
await update_Qrcode(id);
     setState(() {
       loading=false;
     });
  }

  get_data_qrcode(String id_search) async {
    QRcode qRcode = await Get_And_Create_Qrcode().get_Qrcode(id_search);
    print("qrcode  data :"+qRcode.visitReason);
    setState(() {
      visitor_id=qRcode.visitor;
      visit_reason=qRcode.visitReason;
      place=qRcode.place;
      creator=qRcode.creator;
    });

  }
  get_data_creator(String id_search) async {
    User creator = await Get_And_Create_User().get_user(id_search);
    setState(() {

      offcer_name=creator.name;
      offcer_degree=creator.degree;
      offcer_phone_number=creator.phone_number;
    });
    print("creator data :"+creator.name);

  }

  update_Qrcode(String id_qr)async{
    String qRcode = await Get_And_Create_Qrcode().update_Qrcode(id_qr);
    print("qrcode  data :"+qRcode.toString());
  }
}
