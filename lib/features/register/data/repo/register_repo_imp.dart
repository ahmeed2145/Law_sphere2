import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:law_sphere/core/api/api_consumer.dart';
import 'package:law_sphere/core/api/endpoints.dart';
import 'package:law_sphere/core/errors/failure.dart';
import 'package:law_sphere/features/register/data/models/register_model.dart';
import 'package:law_sphere/features/register/data/models/register_respo.dart';

class RegisterRepoImpl {
  final ApiConsumer api;

  RegisterRepoImpl(this.api);

  Future<Either<Failure, RegisterResponse>> register(RegisterModel user) async {
    try {
    final response = await api.post(
  Endpoints.register,
  data: {
    "dto": user.toJson(), 
  },
  isFromData: false,
);

      if (response['success'] == false) {
        final message = response['message'] ?? 'حدث خطأ غير متوقع';
        return Left(ServerFailure(message));
      }

      return Right(RegisterResponse.fromJson(response));

    } on DioException catch (e) {
return Left(ServerFailure.fromDioExceptio(e));
    } on SocketException {
      return Left(ServerFailure('No internet connection'));
    } catch (_) {
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }
}
