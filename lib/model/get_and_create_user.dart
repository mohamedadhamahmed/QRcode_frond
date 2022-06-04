import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qr_code_scanner_example/view_model/user.dart';

import '../constant.dart';

class Get_And_Create_User {
  Future<String> create_user(
    String name,
    String degree,
    String department,
    String military_number,
    String phone_number,
    String email,
    String password,
    bool isadmin,
  ) async {
    print("inside post");
    final response = await http.post(
      Uri.parse(kBackend_Server_IP+'/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'degree': degree,
        'department': department,
        'military_number': military_number,
        'phone_number': phone_number,
        'email': email,
        'password': password,
        'isadmin': isadmin,
      }),
    );
    print("after post" + response.body);

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print(User.fromJson(jsonDecode(response.body)));
      return 'تم تسجيل الزائر بنجاح';
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      return ' user  found in database';

      throw Exception('Failed to Auth .');
    }
    return ' user  found in database';

  }

  Future<User> get_user(String id) async {
    print(id);
    final response = await http.get(
      Uri.parse(kBackend_Server_IP+'/users?id=$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print("after get user 200   :    " + response.body);

      print(User.fromJson(jsonDecode(response.body)));
      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      return User.fromJson(jsonDecode(response.body));

      throw Exception('Failed to Auth .');

    }
  }
}
