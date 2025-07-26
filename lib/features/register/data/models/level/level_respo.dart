import 'package:law_sphere/features/register/data/models/level/level_model.dart';

class LevelResponse {
  final bool success;
  final String message;
  final List<LevelModel> data;
  final dynamic errors;

  LevelResponse({
    required this.success,
    required this.message,
    required this.data,
    required this.errors,
  });
 factory LevelResponse.fromJson(Map<String, dynamic> json) {
    return LevelResponse(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List)
          .map((e) => LevelModel.fromJson(e))
          .toList(),
      errors: json['errors'],
    );
  }
}
