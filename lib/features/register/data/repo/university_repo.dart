import 'package:dio/dio.dart';
import 'package:law_sphere/core/api/endpoints.dart';
import 'package:law_sphere/features/register/data/models/university/university_model.dart';

abstract class UniversityRepo {
  Future<List<UniversityModel>> fetchUniversities();
}

class UniversityRepoImpl implements UniversityRepo {
  final Dio dio;

  UniversityRepoImpl({required this.dio});

  @override
  Future<List<UniversityModel>> fetchUniversities() async {
    final response = await dio.get(Endpoints.universitySelection);

    if (response.data is List) {
      return (response.data as List)
          .map((e) => UniversityModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Unexpected response format');
    }
  }
}
