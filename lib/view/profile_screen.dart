import 'package:flutter/material.dart';
import 'package:qr_code_scanner_example/widgets/custom_textfield.dart';

class Profile_screen extends StatelessWidget {
  static final id = 'Profile_screen';
  const Profile_screen() : super();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    GlobalKey<FormState> form_login_key = GlobalKey<FormState>();
    TextEditingController textpassword = TextEditingController();
    TextEditingController textemail = TextEditingController();
    TextEditingController text_confirm_password = TextEditingController();
    TextEditingController text_username = TextEditingController();
    String password ;
    String email = 'adhammedo1998@gmail.com';
    String username = 'adham medo';
    String confirm;
    bool confirm_text_show = true;
    return Scaffold(
        appBar: new PreferredSize(
          child: new Container(
            padding:
                new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: new Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, top: 20.0, bottom: 20.0),
              child: new Text(
                'Profile',
                style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
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
                  image: AssetImage('1.png',),
                  fit: BoxFit.fill,
                )),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20)),
                  width: width * 0.4,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: height * 0.15,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('adham.jpg'),
                        radius: 70,
                      ),
                      Form(
                        key: form_login_key,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: height * 0.1,
                            ),
                            Custom_TextField(
                              Icons.email,
                              email,
                              (value) {
                                email = value;
                              },
                              textemail,
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            Custom_TextField(
                              Icons.person,
                              username,
                              (value) {
                                username = value;
                              },
                              textpassword,
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            Custom_TextField(
                              Icons.lock,
                              password,
                              (value) {
                                password = value;
                              },
                              textpassword,
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            confirm_text_show
                                ? Custom_TextField(
                                    Icons.lock,
                                    "Confirm password",
                                    (value) {
                                      confirm = value;
                                    },
                                    textpassword,
                                  )
                                : Container(),
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    onPressed: () {
                                      if (form_login_key.currentState
                                          .validate()) {
                                        print(form_login_key.currentState
                                            .validate());

                                        form_login_key.currentState.save();
                                        textemail.clear();
                                        textpassword.clear();
                                        Navigator.pop(context);
                                      } else {
                                        textemail.clear();
                                        textpassword.clear();
                                      }
                                    },
                                    child: Text(
                                      'Update',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
