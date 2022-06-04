import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner_example/model/get_and_create_visitor.dart';

import 'package:qr_code_scanner_example/widgets/custom_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';
import 'admin_home_screen.dart';
import 'create_QR_For_visitor.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class Create_Visitor extends StatefulWidget {
  static String id = "signup_screen";

  const Create_Visitor({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<Create_Visitor> {
  bool loginremmber = false;
  GlobalKey<ScaffoldState> scaffol_signup_dkey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> form_login_key = GlobalKey<FormState>();
  TextEditingController textname = TextEditingController();
  TextEditingController textdegree = TextEditingController();
  TextEditingController text_unit = TextEditingController();
  TextEditingController text_national_number = TextEditingController();
  TextEditingController text_phonenumber = TextEditingController();

  String name;
  String degree;
  String unit;
  String national_number;
  String phone_number;
  String creator;
  bool error;
  var kMainColor = KMainColor;

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
              Form(
                key: form_login_key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: height * 0.1,
                    ),
                    Container(
                        child: CircleAvatar(
                      radius: 85.0,
                      backgroundColor: Colors.black.withOpacity(0),
                      backgroundImage: AssetImage('logo2.png'),
                    )),
                    SizedBox(
                      height: height * 0.08,
                    ),
                    Custom_TextField(
                      Icons.person,
                      "Enter  Visitor Name",
                      (value) {
                        name = value;
                      },
                      textname,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Custom_TextField(
                      Icons.baby_changing_station_sharp,
                      "Enter  Visitor Job",
                      (value) {
                        degree = value;
                      },
                      textdegree,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Custom_TextField(
                      Icons.home_work_outlined,
                      "Enter The Name Of The Unit Or Company",
                      (value) {
                        unit = value;
                      },
                      text_unit,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Custom_TextField(
                      Icons.perm_contact_cal_outlined,
                      "Enter National Or Military Number",
                      (value) {
                        national_number = value;
                      },
                      text_national_number,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Custom_TextField(
                      Icons.phone_android,
                      "Enter Visitor's phone number",
                      (value) {
                        phone_number = value;
                      },
                      text_phonenumber,
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
                              var result_register_visitor;
                              final prefs =
                                  await SharedPreferences.getInstance();
                              final List<String> current_user =
                                  await prefs.getStringList('user_data');
                              if (form_login_key.currentState.validate()) {
                                //   print(form_login_key.currentState.validate());
                                form_login_key.currentState.save();
                                if (text_phonenumber.text.length >= 10 &&
                                    text_national_number.text.length >= 13) {
                                  result_register_visitor =
                                      await Get_And_Create_Visitor()
                                          .create_visitor(
                                              name,
                                              degree,
                                              unit,
                                              national_number,
                                              phone_number,
                                              current_user[0]);
                                  print('resulty :' + result_register_visitor);

                                  await showMyDialog(
                                      context, 'تم تسجيل الزائر بنجاح');
                                  textname.clear();
                                  text_phonenumber.clear();
                                  text_national_number.clear();
                                  textdegree.clear();
                                  if (current_user[3] == 'true') {
                                    Navigator.pushNamed(
                                        context, Admin_Home_Screen.id);
                                  } else {
                                    Navigator.pushNamed(
                                        context, Home_Screen.id);
                                  }
                                } else {
                                  showMyDialog(context,
                                      '    يجيب ادخال الرقم القومى 14 رقم ورقم الهاتف 10 ارقام');

                                  text_phonenumber.clear();
                                  text_national_number.clear();
                                }
                                // showDialog<String>(
                                //     context: context,
                                //     builder: (BuildContext context) =>
                                //         AlertDialog(
                                //           title: const Text('Message'),
                                //           content: Text(false
                                //               ? 'please enter password and confirm password '
                                //               : "enter valid email forrmat"),
                                //           actions: <Widget>[
                                //             TextButton(
                                //               onPressed: () => Navigator.pop(
                                //                   context, 'Cancel'),
                                //               child: const Text('Cancel'),
                                //             ),
                                //             TextButton(
                                //               onPressed: () =>
                                //                   Navigator.pop(context, 'OK'),
                                //               child: const Text('OK'),
                                //             ),
                                //           ],
                                //         ));
                              } else {
                                // Services().signup(text_username.text,
                                //     textemail.text, textpassword.text);
                                textname.clear();
                                text_unit.clear();
                                text_phonenumber.clear();
                                text_national_number.clear();
                                textdegree.clear();
                                //   showMyDialog(
                                //       context,
                                //       false
                                //           ? 'please enter password and confirm password '
                                //           : "enter valid email forrmat");
                                //
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'تسجيل',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
