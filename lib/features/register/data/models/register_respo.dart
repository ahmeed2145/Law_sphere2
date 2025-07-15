class RegisterResponse {
  final int userId;

  RegisterResponse({required this.userId});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return RegisterResponse(
      userId: data != null ? data['id'] ?? 0 : 0,
    );
  }
}
