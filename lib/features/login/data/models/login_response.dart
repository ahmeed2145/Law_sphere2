class LoginResponse {
  final bool success;
  final String message;
  final List<String> errors;
  final LoginData data;

  LoginResponse({
    required this.success,
    required this.message,
    required this.errors,
    required this.data
  });
factory LoginResponse.fromJson(Map<String,dynamic>json){
  return LoginResponse(success: json['success'] ??false,
   message:json['message']??'' , errors: json['errors'],
    data: json['data']
   
   );

}
 Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data.toJson(),
        'errors': errors,
      };
  
}

class LoginData {
  final String token;
  final User user;

  LoginData({required this.token, required this.user});
  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(token: json['token'], user: json['user']);
  }
  Map<String, dynamic> toJson() => {'token': token, 'user': user.toJson()};
}

class User {
  final String id;
  final String fullName;
  final String email;
  int? age;
  final int level;
  final String mobile;
  final String university;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.level,
    required this.mobile,
    required this.university,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      level: json['level'],
      mobile: json['mobile'],
      university: json['university'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'fullName': fullName,
    'email': email,
    'age': age,
    'level': level,
    'mobile': mobile,
    'university': university,
  };
}
