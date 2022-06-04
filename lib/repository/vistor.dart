import 'dart:convert';

class Visitor {
  final String name;
  final String degree;
  final String unit;
  final int national_number;
  final String phone_number;
  final String creator;

  Visitor(
      {this.name,
      this.degree,
      this.unit,
      this.national_number,
      this.phone_number,
      this.creator});

  factory Visitor.fromJson(Map<String, dynamic> json) {
    return Visitor(
      name: json['name'],
      degree: json['degree'],
      unit: json['unit'],
      national_number: json['national_number'],
      phone_number: json['phone_number'],
      creator: json['creator'],
    );
  }
  tojson(Visitor user) {
    return jsonEncode(<String, dynamic>{
      'name': name,
      'degree': degree,
      'unit': unit,
      'national_number': national_number,
      'phone_number': phone_number,
      'creator': creator,
    });
  }
}
