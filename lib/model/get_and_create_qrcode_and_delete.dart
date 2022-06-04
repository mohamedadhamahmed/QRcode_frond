import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qr_code_scanner_example/view_model/qrcode.dart';
import 'package:qr_code_scanner_example/view_model/user.dart';

import '../constant.dart';

class Get_And_Create_Qrcode {
  Future<String> create_Qrcode(QRcode qrcode) async {
    print( qrcode.place);
    final response = await http.post(
      Uri.parse('http://192.168.2.107:4000/create_QRcode'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'visitor': qrcode.visitor,
        'visitReason': qrcode.visitReason,
        'place':qrcode.place,
        'creator': qrcode.creator,
      }),
    );
    print("after post qrcode new" + response.body);
    if (response.statusCode == 200) {
     // return QRcode.fromJson(jsonDecode(response.body));
      return  response.body.toString();
    } else {

      throw Exception('Failed to Auth .');
    }
  }


  Future<QRcode> get_Qrcode(String id) async {
    print(id);
    print('hamda');
    print(kBackend_Server_IP+"/create_QRcode?id=${id}");
    print(Uri.parse(kBackend_Server_IP+"/create_QRcode?id=$id"));
    final response = await http.get(
      Uri.parse(kBackend_Server_IP+'/create_QRcode?id='+id,),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

    );
    print("after get qrcode" + response.body);

    if (response.statusCode == 200) {
      print("after get qrcode 200  :    " + response.body);
      print(QRcode.fromJson(jsonDecode(response.body)));
      return QRcode.fromJson(jsonDecode(response.body));
    } else {

      throw Exception('Failed to Auth .');
    }
  }


  Future<String> update_Qrcode(String id) async {
    final response = await http.put(
      Uri.parse(kBackend_Server_IP+'/create_QRcode?id=$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print("after get qrcode" + response.body);

    if (response.statusCode == 200) {
      print("after deleted qrcode 200  :    " + response.body);
      print(response.body);
      return 'Qrcode updated';
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to Auth .');
    }
  }
}
