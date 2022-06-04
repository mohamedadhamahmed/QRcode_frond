import 'dart:developer';
import 'dart:io';
import 'package:universal_html/html.dart' as html;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner_example/model/get_and_create_qrcode_and_delete.dart';
import 'package:qr_code_scanner_example/view_model/qrcode.dart';
import 'package:qr_code_scanner_example/view/show_visitor_data_screen.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
String errors='error';
  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Expanded(flex: 4, child: _buildQrView(context)),
            Expanded(
              flex: 1,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 70),
                    child: Text(
                      ' ${result != null ? "Data: " + result.code :errors}',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  AudioPlayer audioPlayer = AudioPlayer();

  playSound() async {
    int result = await audioPlayer.play(
        "http://codeskulptor-demos.commondatastorage.googleapis.com/descent/gotitem.mp3");
    if (result == 1) {
      // success
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        playSound();
        result = scanData;
       if(result!= null){
         print(result.code);
         check_qrcode_in_database(result.code);

       }
      });
    }).onError((err){
      setState(() {
        errors="error when scan";
      });
    });
  }
check_qrcode_in_database(String id_search)async{
  QRcode qRcode = await Get_And_Create_Qrcode().get_Qrcode(id_search);
  print("qrcode search data :"+qRcode.visitReason);
  if(qRcode!=null && qRcode.isused==false){
    print("hi");
    setState(() {
      controller?.dispose();

    });
    Navigator.pushNamed(context,
        Show_Visitor_Data.id,arguments: {"id" :
        result.code});
  }
  else{

  }
  // String  visit_reason=qRcode.visitReason;
  // String  place=qRcode.place;
  // String creator=qRcode.creator;

}
  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }


}
