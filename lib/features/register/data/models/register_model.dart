class RegisterModel {
  final String email;
  final String password;
  final String fullName;
  final int role;
  final String mobile;

  RegisterModel({
    required this.email,
    required this.password,
    required this.fullName,
    required this.role,
    required this.mobile,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'fullName': fullName,
      'role': role,
      'mobile': mobile,
    };
  }
}
