import 'dart:math';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner_example/model/get_and_create_qrcode_and_delete.dart';
import 'package:qr_code_scanner_example/model/get_and_create_visitor.dart';
import 'package:qr_code_scanner_example/view_model/qrcode.dart';
import 'package:qr_code_scanner_example/view_model/vistor.dart';
import 'package:qr_code_scanner_example/view/qr_create_page.dart';

import 'package:qr_code_scanner_example/widgets/custom_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';

class Create_QRCODE_vistor extends StatefulWidget {
  static String id = "Create_QRCODE_vistor";

  const Create_QRCODE_vistor({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<Create_QRCODE_vistor> {

  bool loginremmber = false;
  bool step1 = true;
  bool step2 = false;
  bool step3 = false;
  GlobalKey<ScaffoldState> scaffol_signup_dkey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> form_login_key = GlobalKey<FormState>();
  TextEditingController text_NationalID = TextEditingController();
  TextEditingController text_place_name = TextEditingController();
  TextEditingController textVisitorName = TextEditingController();
  TextEditingController text_visitreason = TextEditingController();
  TextEditingController text_phon_number = TextEditingController();
  TextEditingController search_id_contriller = TextEditingController();

  String NationalID_s;
  String textVisitoName_s;
  String visitreason_s;
  String phone_visitor;
  var kMainColor = KMainColor;
  String search_id;
  String creator = '';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Material(
      child: Stack(
        children: [
          Container(
              // width: double.infinity,
              width: double.infinity,
              height: double.infinity,
              child: Image(
                image: AssetImage('1.png'),
                fit: BoxFit.cover,
              )),
          ListView(
            children: [
              Center(
                child: Container(
                  width: width * 0.5,
                  child: Form(
                    key: form_login_key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Steps(width),
                        SizedBox(
                          height: height * 0.1,
                        ),
                        Container(width: width * 0.2, child: textfield(height)),
                        SizedBox(
                          height: height * 0.1,
                        ),
                        Custom_TextField(
                          Icons.person,
                          "Enter  Visitor Name",
                          (value) {
                            textVisitoName_s = value;
                          },
                          textVisitorName,
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Custom_TextField(
                          Icons.home_work,
                          "place name",
                          (value) {
                            text_place_name = value;
                          },
                          text_place_name,
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Custom_TextField(
                          Icons.perm_contact_cal_outlined,
                          "The reason for the visit",
                          (value) {
                            visitreason_s = value;
                          },
                          text_visitreason,
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Custom_TextField(
                          Icons.phone_android,
                          "Phone Number",
                          (value) {
                            phone_visitor = value;
                          },
                          text_phon_number,
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Center(
                          child: Container(
                            // height: constraints.maxHeight * 0.1,

                            //  width: constraints.maxWidth * 0.3,

                            child: RaisedButton(
                                color: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () async {
                                  if (form_login_key.currentState.validate()) {
                                     print(
                                        form_login_key.currentState.validate());
                                    print('Create QR Code');

                                    //  form_login_key.currentState.save();
                                    print('create new');
                                    final prefs =
                                        await SharedPreferences.getInstance();

                                    final List<String> creator_data =
                                        prefs.getStringList('user_data');
                                    await Get_And_Create_Qrcode().create_Qrcode(
                                        QRcode(
                                            isused: false,
                                            visitor: NationalID_s,
                                            visitReason: text_visitreason.text,
                                            place: text_place_name.text,
                                            creator: creator_data[0]));

                                    textVisitorName.clear();
                                    text_NationalID.clear();
                                    text_phon_number.clear();
                                    text_visitreason.clear();
                                    text_place_name.clear();
                                     final _prefs =await  SharedPreferences.getInstance();
                                     await _prefs.setString('id_visitor', NationalID_s);
                                     print('done');
                                    Navigator.pushNamed(
                                      context,
                                      QRCreatePage.id,
                                      arguments: {
                                        'id': NationalID_s
                                      },
                                    );
                                  }
                                },
                                child: Text(
                                  'Create QR',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget textfield(double height) {
    return Container(
      height: height * 0.05,
      child: TextFormField(
        controller: search_id_contriller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          // prefixIcon: Icon(
          //   Icons.search_rounded  ,
          //   color: Colors.black,
          // ),
          suffix: IconButton(
              color: Colors.grey,
              onPressed: () async {
                if (search_id_contriller.text.isEmpty) {
                  print("null value++++");
search_id_contriller.clear();
                  showMyDialog(context,'please enter National ID or military number.');
                } else {
                  print('fetched visitor');
                  Visitor visitor = await Get_And_Create_Visitor()
                      .fetchvisitor(search_id_contriller.text);
                if(visitor!=null){
                  setState(() {
                    step2 = true;
                    NationalID_s=search_id_contriller.text;
                    textVisitorName.text = visitor.name;
                    text_NationalID.text = visitor.national_number.toString();
                    text_phon_number.text = visitor.phone_number;
                    creator = visitor.creator;
                  });
                  search_id_contriller.clear();

                  print(visitor);
                }
                  print(search_id_contriller.text);
                }
              },
              icon: Icon(
                Icons.search_rounded,
                color: Colors.black,
              )),
          hintText: " Search by National ID or military number",
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.red)),
        ),
      ),
    );
  }

  Widget Steps(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Center(
            child: Text(
              '1',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green,
          ),
          height: 25,
          width: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 3, right: 3),
          child: Container(
            child: Center(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: step2 ? Colors.green : Colors.white,
            ),
            height: 10,
            width: width * 0.15,
          ),
        ),
        Container(
          child: Center(
            child: Text(
              '2',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: step2 ? Colors.green : Colors.white,
          ),
          height: 25,
          width: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 3, right: 3),
          child: Container(
            child: Center(),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: step3 ? Colors.green : Colors.white),
            height: 10,
            width: width * 0.15,
          ),
        ),
        Container(
          child: Center(
            child: Text(
              '3',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: step3 ? Colors.green : Colors.white),
          height: 25,
          width: 25,
        ),
      ],
    );
  }

}
