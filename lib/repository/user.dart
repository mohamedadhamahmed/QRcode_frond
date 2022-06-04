  import 'dart:convert';

class User {
  final String name;
  final String degree;
  final String department;
  final String military_number;
  final String phone_number;
  final String email;
  final String password;
  final bool isadmin;


  User({this.name, this.degree, this.department, this.military_number, this.phone_number, this.email, this.password, this.isadmin

  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      degree: json['degree'],
      department: json['department'],
      military_number: json['military_number'],
      phone_number: json['phone_number'],
      email: json['email'],
      password: json['password'],
      isadmin: json['isadmin'],
    );
  }
  tojson(User user) {
    return jsonEncode(<String, dynamic>{
      'name': name,
      'degree':degree,
      'department':department,
      'military_number':military_number,
      'phone_number':phone_number,
      'email':email,
      'password':password,
      'isadmin':isadmin,
    });
  }
}