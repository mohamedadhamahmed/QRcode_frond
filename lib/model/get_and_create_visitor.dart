import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qr_code_scanner_example/view_model/user.dart';
import 'package:qr_code_scanner_example/view_model/vistor.dart';

import '../constant.dart';

class Get_And_Create_Visitor {
  Future<String> create_visitor(
      String name,
      String degree,
      String unit,
      String national_number,
      String phone_number,
      String creator,

      ) async {
    print("inside post");
     var response;
   try{
      response = await http.post(
       Uri.parse(kBackend_Server_IP+'/visitors'),
       headers: <String, String>{
         'Content-Type': 'application/json; charset=UTF-8',
       },
       body: jsonEncode(<String, dynamic>{
         'name': name,
         'degree': degree,
         'unit': unit,
         'national_number': int.parse(national_number),
         'phone_number': phone_number,
         'creator': creator,
       }),
     );
     print("after post" + response.body);

     if (response.statusCode == 200) {
       // If the server did return a 201 CREATED response,
       // then parse the JSON.
       print('ok');
       print(User.fromJson(jsonDecode(response.body)));
       return 'تم تسجيل الزائر بنجاح';

    }
      return ' user  found in database';

     // if( response.body.toString()=='user  found in database'){
      //   return 'user  found in database';
      // }
   } catch ( e)
   {
     print('error');

     print(jsonDecode(response.body));
     return ' user  found in database';

     print(e);
   }
  }


  Future<Visitor> fetchvisitor( String  national_number) async {
    String url=kBackend_Server_IP+'/visitors?national_number=$national_number';
       print(url);
  try  {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        print(response.body);
        return Visitor.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        print(response.body);
        return Visitor.fromJson(jsonDecode(response.body));

        throw Exception('Failed to load album');
      }
    }catch(e){
    print(e);
  }
  }
}
