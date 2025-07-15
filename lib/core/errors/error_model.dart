class ErrorModel {
	String? error;
	String? code;

	ErrorModel({this.error, this.code});

	factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
				error: json['error'] as String?,
				code: json['code'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'error': error,
				'code': code,
			};
}
