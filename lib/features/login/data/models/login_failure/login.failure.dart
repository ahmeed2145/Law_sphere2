class Login {
	
  String? error;
	String? code;

	Login({this.error, this.code});

	factory Login.fromJson(Map<String, dynamic> json) => Login(
				error: json['error'] as String?,
				code: json['code'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'error': error,
				'code': code,
			};
}
