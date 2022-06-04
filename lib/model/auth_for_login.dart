import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qr_code_scanner_example/view_model/auth.dart';

import '../constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Auth_Login {
  Future<Auth> auth(String email, String password) async {
    final _prefs = await SharedPreferences.getInstance();

    print("inside post");
    final response = await http.post(
      Uri.parse(kBackend_Server_IP+'/auth'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, "password": password}),
    );
    print("after post" + response.body);
    if (response.body == "invalid email or password") {
      return null;
    }
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      var user_data=Auth.fromJson(jsonDecode(response.body));
      String name=user_data.office_name;
      String officer_id=user_data.officer_id;
      String degree=user_data.officer_degree;
      bool isadmin=user_data.isadmin;
      print(user_data.office_name);
      print(user_data.officer_id);
      await _prefs.setStringList('user_data', <String>[officer_id, name,degree,isadmin.toString()]);

      print(Auth.fromJson(jsonDecode(response.body)));
      return Auth.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to Auth .');
    }
  }
}
