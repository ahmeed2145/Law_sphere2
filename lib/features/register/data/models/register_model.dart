class RegisterModel {
  final String email;
  final String password;
  final String fullName;
  final int role;
  final String mobile;
  final String  university;
  final int  level;

  RegisterModel( {
    required this.email,
    required this.password,
    required this.fullName,
    required this.role,
    required this.mobile,
     required this.university, required this.level,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'fullName': fullName,
      'role': role,
      'mobile': mobile,
      "university": university,
      "level":level,
    };
  }
}
