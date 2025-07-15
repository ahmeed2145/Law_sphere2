class LoginResponse {
	String? token;

	LoginResponse({this.token});

	factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
				token: json['token'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'token': token,
			};
}
