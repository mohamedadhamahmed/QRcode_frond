class Auth {
  final String officer_id;
  final String office_name;
  final bool isadmin;
  final String officer_degree;
  final String officer_department;

  Auth({
    this.officer_id,
    this.office_name,
    this.isadmin,
    this.officer_degree,
    this.officer_department,
  });

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      officer_id: json['_id'],
      office_name: json['name'],
      isadmin: json['isadmin'],
      officer_degree: json['degree'],
      officer_department: json['department'],
    );
  }
}