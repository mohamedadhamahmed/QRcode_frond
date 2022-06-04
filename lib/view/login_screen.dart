import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:qr_code_scanner_example/model/auth_for_login.dart';
import 'package:qr_code_scanner_example/view_model/auth.dart';
import 'package:qr_code_scanner_example/view/create_QR_For_visitor_screen.dart';
import 'package:qr_code_scanner_example/view/create_visitor_screen.dart';
import 'package:qr_code_scanner_example/widgets/custom_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant.dart';
import 'admin_home_screen.dart';
import 'home_screen.dart';
//import 'package:animated_text_kit/animated_text_kit.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class Login_Screen extends StatefulWidget {
  static String id = "login_screen";
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Login_Screen> {
  bool loginremmber = false;
  bool invalid = false;
  bool value = false;
  GlobalKey<ScaffoldState> scaffol_login_dkey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> form_login_key = GlobalKey<FormState>();
  TextEditingController textpassword = TextEditingController();
  TextEditingController textemail = TextEditingController();
  String password;
  String email;
  static const IconData copyright =
      IconData(0xe198, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    var kMainColor = KMainColor;
    return Scaffold(
      backgroundColor: Colors.white,
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
          Positioned(
            top: height * 0.05,
            left: width * 0.1,
            right: width * 0.1,
            bottom: 20,
            child: LayoutBuilder(
              builder: (BuildContext ctx, BoxConstraints constraints) {
                return Container(
                    alignment: Alignment.center,

                    /// Using parent's constraints
                    /// to calculate child's height and width
                    height: constraints.maxHeight * 0.5,
                    width: constraints.maxWidth * 0.5,
                    child: Center(
                      child: Container(
                        width: width * 0.5,
                        child: ListView(
                          children: [
                            Form(
                              key: form_login_key,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      child: CircleAvatar(
                                    radius: 85.0,
                                    backgroundColor:
                                        Colors.black.withOpacity(0),
                                    backgroundImage: AssetImage('logo2.png'),
                                  )),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                    width: width * 0.35,
                                    height: height * 0.15,
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'المعهد الفنى للقوات المسلحة',
                                          style: TextStyle(
                                              // fontSize: 25.0,
                                              // fontFamily: 'Bobbers',
                                              // fontWeight: FontWeight.bold,
                                              fontSize: width * 0.02,
                                              fontFamily: 'Bobbers',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        DefaultTextStyle(
                                          style: TextStyle(
                                              fontSize: width * 0.015,
                                              fontFamily: 'Bobbers',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white70),
                                          child: AnimatedTextKit(
                                              animatedTexts: [
                                                TyperAnimatedText(
                                                    'الإيمان     العمل     التضحية')
                                              ]),
                                        ),
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                      ],
                                    )),
                                  ),

                                  SizedBox(
                                    height: height * 0.1,
                                  ),
                                  !invalid
                                      ? Container()
                                      : Container(
                                          width: width * 0.3,
                                          height: height * 0.05,
                                          child: Center(
                                              child: Text(
                                            "invalid email or password",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          )),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color:
                                                Colors.black.withOpacity(0.6),
                                          ),
                                        ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Custom_TextField(
                                    Icons.email,
                                    "Enter your Email",
                                    (value) {
                                      email = value;
                                    },
                                    textemail,
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),

                                  Custom_TextField(
                                    Icons.lock,
                                    "Enter your password",
                                    (value) {
                                      password = value;
                                    },
                                    textpassword,
                                    ontap:()async{
                                      print('tap');
                                  //   await action();
                                    },
                                  ),

                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                 Padding(
                                   padding:  EdgeInsets.only(left: width*0.06),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: [
                                       Checkbox(
                                         value: this.value,
                                         activeColor: Colors.green,
                                         checkColor: Colors.white,
                                         focusColor: Colors.black,
                                         onChanged: (bool value) async{
                                           final prefs = await SharedPreferences.getInstance();
                                           setState(() {
                                             this.value = value;
                                             if(this.value==true){
                                                prefs.setBool('rember_me', true);
                                                print(value);

                                             }
                                             else{
                                               prefs.setBool('rember_me', false);
                                               print(value);

                                             }
                                           });
                                         },
                                       ),Text('Rember me',   style: TextStyle(fontSize: 16,
                                           color: Colors.white,
                                           fontWeight:
                                           FontWeight.bold),)
                                     ],
                                   ),
                                 ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  Center(
                                    child: Container(
                                      // height: constraints.maxHeight * 0.1,

                                      //  width: constraints.maxWidth * 0.3,

                                      child: Container(
                                          width: 70,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: GestureDetector(
                                            onTap: ()async{
                                              await action();
                                            },
                                            child: Center(
                                              child: Text(
                                                'دخـول',
                                                style: TextStyle(fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: <Widget>[
                                  //     Text(
                                  //       "Don't have an account?",
                                  //       style: TextStyle(
                                  //         color: Colors.white,
                                  //         fontSize: 16,
                                  //       ),
                                  //     ),
                                  //     GestureDetector(
                                  //         onTap: () {
                                  //           Navigator.pushNamed(
                                  //               context, SignUp.id);
                                  //         },
                                  //         child: Text(
                                  //           "Sign up",
                                  //           style: TextStyle(
                                  //               color: Colors.black,
                                  //               fontWeight: FontWeight.bold,
                                  //               fontSize: 17),
                                  //         ))
                                  //   ],
                                  // ),
                                  SizedBox(
                                    height: height * 0.05,
                                  ),

                                  // static const IconData copyright = IconData(0xe198, fontFamily: 'MaterialIcons');
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
              },
            ),
          ),
          Positioned(
            bottom: 5,
            child: Center(
              child: Container(
                padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                child: Text(
                  "Copyright © 2021 فرع النظم المعلومات",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  action()async{

      if (form_login_key.currentState
          .validate()) {
        print(form_login_key
            .currentState
            .validate());

        form_login_key.currentState
            .save();
        // var date = await Services()
        //     .login(textemail.text,textpassword.text);
        // print(date);
        // arguments: {'id':NationalID_s}

        // Login_View_Model(textemail.text,textpassword.text).press_button_login();

        Auth_Login authlogin =
        Auth_Login();
        Auth auth_data =
        await authlogin.auth(
            textemail.text,
            textpassword.text);
        if (auth_data == null) {
          print("ruturn null");
          setState(() {
            invalid = true;
          });
          textemail.clear();
          textpassword.clear();
        } else if (auth_data.isadmin) {
          print(auth_data.isadmin);
          textemail.clear();
          textpassword.clear();
          Navigator.pushNamed(context,
              Admin_Home_Screen.id);
        } else {
          textemail.clear();
          textpassword.clear();
          Navigator.pushNamed(
              context, Home_Screen.id);
        }

        // if( textemail.text=="admin" && textpassword.text=="admin" )
        // {
        //   Navigator.pushNamed(context, Admin_Home_Screen.id);
        // }

        //
        // else{
        //
        //    Navigator.pushNamed(
        //        context, Home_Screen.id);
        //    textemail.clear();
        //    textpassword.clear();
        //  }
      } else {
        textemail.clear();
        textpassword.clear();
      }
      //do some thing

  }
}
