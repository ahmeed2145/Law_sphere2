import 'package:dio/dio.dart';
import 'package:law_sphere/core/api/endpoints.dart';
import 'package:law_sphere/features/register/data/models/level/level_respo.dart';
abstract class ILevelRepo {
  Future<LevelResponse> fetchLevels();
}

class LevelRepo {
  final Dio dio;

  LevelRepo({required this.dio});

  Future<LevelResponse> fetchLevels() async {
    final response = await dio.get(Endpoints.levelUsed);
    return LevelResponse.fromJson(response.data);
  }
}
