import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner_example/model/get_and_create_user.dart';
import 'package:qr_code_scanner_example/view_model/user.dart';

import 'package:qr_code_scanner_example/widgets/custom_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';
import 'admin_home_screen.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class create_User_Form extends StatefulWidget {
  static String id = "signup_screen";

  const create_User_Form({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

enum SingingCharacter { Admin, User }

class _SignUpState extends State<create_User_Form> {
  bool loginremmber = false;
  GlobalKey<ScaffoldState> scaffol_signup_dkey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> form_login_key = GlobalKey<FormState>();
  TextEditingController textusername = TextEditingController();
  TextEditingController textdegree = TextEditingController();
  TextEditingController text_department = TextEditingController();
  TextEditingController text_military_number = TextEditingController();
  TextEditingController text_phone_number = TextEditingController();
  TextEditingController text_email = TextEditingController();
  TextEditingController text_password = TextEditingController();
  TextEditingController text_conf_password = TextEditingController();
  String username;
  String degree;
  String department;
  String military_number;
  String phone_number;
  String email;
  String password;
  String conf_password;
  var kMainColor = KMainColor;
  bool isadmin = false;
  SingingCharacter _character = SingingCharacter.User;

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
                      "Enter  Username",
                      (value) {
                        username = value;
                      },
                      textusername,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Custom_TextField(
                      Icons.perm_contact_cal_outlined,
                      "Enter  User Degree",
                      (value) {
                        degree = value;
                      },
                      textdegree,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Custom_TextField(
                      Icons.developer_board_outlined,
                      "Enter User Department",
                      (value) {
                        department = value;
                      },
                      text_department,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Custom_TextField(
                      Icons.image_aspect_ratio,
                      "Enter User Military Number",
                      (value) {
                        military_number = value;
                      },
                      text_military_number,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Custom_TextField(
                      Icons.phone_android,
                      "Enter User Phone Number",
                      (value) {
                        phone_number = value;
                      },
                      text_phone_number,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Custom_TextField(
                      Icons.email_outlined,
                      "Enter  Email",
                      (value) {
                        email = value;
                      },
                      text_email,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Custom_TextField(
                      Icons.lock,
                      "Enter password",
                      (value) {
                        password = value;
                      },
                      text_password,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Custom_TextField(
                      Icons.lock,
                      "Confirm Password",
                      (value) {
                        conf_password = value;
                      },
                      text_conf_password,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          RadioListTile<SingingCharacter>(
                            title: Text('User',
                                style: TextStyle(
                                    fontSize: width * 0.01,
                                    fontFamily: 'Bobbers',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70)),
                            activeColor: Colors.green,
                            value: SingingCharacter.User,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              setState(() {
                                _character = value;
                                isadmin = false;
                                print(_character.index);
                              });
                            },
                          ),
                          RadioListTile<SingingCharacter>(
                            activeColor: Colors.green,
                            title: Text('admin',
                                style: TextStyle(
                                    fontSize: width * 0.01,
                                    fontFamily: 'Bobbers',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70)),
                            value: SingingCharacter.Admin,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              setState(() {
                                _character = value;
                                isadmin = true;
                                print(_character.index);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: height * 0.1),
                        child: RaisedButton(
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () async {
                            if (form_login_key.currentState.validate()) {
                              print(form_login_key.currentState.validate());
                              print('sing up');

                              form_login_key.currentState.save();

                              if (text_conf_password.text !=
                                          text_password.text ||

                                  !text_email.text.contains('@')) {

                                if (text_email.text.contains('@')) {
                                  showMyDialog(context,
                                      "اعد اكتب الرقم السرى وتاكيد الرقم السرى مره اخرى");
                                  text_conf_password.clear();
                                  text_password.clear();
                                }
                                   else{
                                  showMyDialog(
                                      context, "enter valid email format");
                                   }

                              } else {
                                if (military_number.length == 6 &&
                                    phone_number.length >= 11) {
                                  var result_create_user =
                                      await Get_And_Create_User().create_user(
                                          username,
                                          degree,
                                          department,
                                          military_number,
                                          phone_number,
                                          email,
                                          password,
                                          isadmin);
                                  print('result create user' +
                                      result_create_user);

                                  if (result_create_user ==
                                      'تم تسجيل الزائر بنجاح') {
                                    await showMyDialog(
                                        context, result_create_user);
                                    text_email.clear();
                                    text_password.clear();
                                    text_conf_password.clear();
                                    text_phone_number.clear();
                                    text_military_number.clear();
                                    text_department.clear();
                                    textdegree.clear();
                                    textusername.clear();

                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    final List<String> current_user =
                                        await prefs.getStringList('user_data');
                                    if (current_user[3] == 'true') {
                                      Navigator.pushNamed(
                                          context, Admin_Home_Screen.id);
                                    } else {
                                      Navigator.pushNamed(
                                          context, Home_Screen.id);
                                    }
                                  } else {
                                    await showMyDialog(
                                        context, result_create_user);
                                  }
                                } else {
                                  if (phone_number.length < 11) {
                                    showMyDialog(context,
                                        '    يجيب ادخال رقم الهاتف 11 رقم');

                                    text_phone_number.clear();
                                  } else {
                                    showMyDialog(context,
                                        '    يجيب ادخال الرقم العسكرى عن 6 أرقام  ');

                                    text_military_number.clear();
                                  }
                                }
                              }
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'تسجيل',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
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
