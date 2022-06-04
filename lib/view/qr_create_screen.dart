import 'dart:html';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner_example/model/get_and_create_qrcode_and_delete.dart';
import 'package:qr_code_scanner_example/model/get_and_create_user.dart';
import 'package:qr_code_scanner_example/view_model/qrcode.dart';
import 'package:qr_code_scanner_example/view_model/user.dart';
import 'package:qr_code_scanner_example/view/print_qrcode_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/get_and_create_visitor.dart';
import '../view_model/vistor.dart';

class QRCreatePage extends StatefulWidget {
  static String id = "QRCreatePage";
  @override
  _QRCreatePageState createState() => _QRCreatePageState();
}

class _QRCreatePageState extends State<QRCreatePage> {
  final controller = TextEditingController();

  var id;
  bool loading=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 getId();
  }
  getId()async{
    print('get id');
    setState(() {
      loading=true;
    });
    final prefs = await SharedPreferences.getInstance();
   id =await prefs.getString('id_qrcode');
    setState(() {
      loading=false;
    });
    print(id);

  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // final arguments = ModalRoute.of(context).settings.arguments as Map;
    //
    // if (arguments != null) {
    //   id = arguments['id'];
    //   print("id"+id);
    //
    // }

    return Scaffold(
      appBar: new PreferredSize(

        child: new Container(
          padding:
          new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: new Padding(
            padding:
            const EdgeInsets.only(left: 30.0, top: 20.0, bottom: 20.0),
            child: new Row(children: [
              IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,),onPressed: (){
                Navigator.of(context).pop();
              },),
              Text(
                'Qrcode Information',
                style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],)
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
      backgroundColor: Colors.white,
      body:loading==true?Center(child: CircularProgressIndicator(color: Colors.white,strokeWidth: 4,)): Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color:  Colors.white,
              width: width*0.25,
              height: height*0.25,
              child: BarcodeWidget(
                // width: width*0.15,
                // height: height*0.2,
                barcode: Barcode.qrCode(),
                color: Colors.black,
                data: id ,

              ),
            ),
            SizedBox(height: height*0.15),
            RaisedButton(
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: ()  {
                  setState(() {
                    loading=true;
                  });
                  print('go to print pdf');
                  Navigator.pushNamed(context, PDFSave.id);
                },
                child: Text(

                  'طباعة',
                  textDirection:TextDirection.rtl,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,fontSize: 18),
                )),
]
        ),
      )) ;
  }



}
