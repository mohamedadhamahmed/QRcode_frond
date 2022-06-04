import 'dart:convert';

class QRcode {
  final String visitor;
  final String visitReason;
  final String place;
  final String creator;
  final bool isused ;



  QRcode(
      {this.isused,this.visitor, this.visitReason, this.place, this.creator});
  factory QRcode.fromJson(Map<String, dynamic> json) {
    return QRcode(
      visitor: json['visitor'].toString(),
      visitReason: json['visitReason'],
      place: json['place'],
      creator: json['creator'],
      isused:json['isused']
    );
  }
  tojson(QRcode user) {
    return jsonEncode(<String, dynamic>{
      'visitor': visitor,
      'visitReason':visitReason,
      'place':place,
      'creator':creator,
    });
  }
}