class ForgotPasswordModel {
  final String email;

  ForgotPasswordModel({required this.email});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
  return ForgotPasswordModel(
    email: json['email'] ?? '',
  );
}
}