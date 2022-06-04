import 'dart:html';

import 'package:qr_code_scanner_example/model/auth_for_login.dart';
import 'package:qr_code_scanner_example/repository/auth.dart';
import 'package:qr_code_scanner_example/view/admin_home_screen.dart';
import 'package:qr_code_scanner_example/view_model/auth.dart';

class Login_View_Model{
final String username;
final String password;

  Login_View_Model(this.username, this.password);


  void press_button_login()async
  {
    print("press_button_login");
    Auth_Login authlogin=Auth_Login();
    var auth_data=await authlogin.auth(username,password);
    print(auth_data.isadmin);
    if(auth_data.isadmin){
      print("inside admin screen");
      Admin_Home_Screen();
    }
  }

}