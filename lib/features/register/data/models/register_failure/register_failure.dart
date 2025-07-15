class Register {
  String? error;
  String? code;

  Register({this.error, this.code});

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        error: json['error'] as String?,
        code: json['code'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'error': error,
        'code': code,
      };
}
