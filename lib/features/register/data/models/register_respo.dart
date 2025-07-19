class RegisterResponse {
  final bool success;
  final String message;
  final String data;
  final dynamic errors;

  RegisterResponse({
    required this.success,
    required this.message,
    required this.data,
    this.errors,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] ?? '',
      errors: json['errors'],
    );
  }
}
