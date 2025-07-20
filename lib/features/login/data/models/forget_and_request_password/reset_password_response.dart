class ResetPasswordResponse {
  final String message;

  ResetPasswordResponse({required this.message});

  factory ResetPasswordResponse.fromRawText(String text) {
    return ResetPasswordResponse(message: text);
  }
}