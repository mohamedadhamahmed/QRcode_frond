import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

DateTime timestamp = DateTime.now();
const KMainColor = Color(0xFFFFC12F);
const KTextfield = Color(0xFFFFE6AC);
const ktimestamp = 'timestap';
const kProductName = 'productName';
const kBackend_Server_IP = 'http://192.168.2.107:4000';




// void KeepUserLoggOut() async {
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   preferences.setBool(kKeepMeLoggedIn, false);
// }


Future<void> showMyDialog(BuildContext context,String massege) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // title:  Text('تحذير',style:TextStyle(
        //     color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16),textDirection: TextDirection.rtl,),
        content: SingleChildScrollView(
          child: ListBody(
            children:  <Widget>[
              Text(massege,style:TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16),textDirection: TextDirection.rtl,),
            ],
          ),
        ),
        actions: <Widget>[
          Center(
            child: Container(
              color: Colors.grey,
              child: TextButton(
                child: const Text(
                  'ok',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ],
      );
    },
  );
}
