import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:law_sphere/core/api/api_consumer.dart';
import 'package:law_sphere/core/api/endpoints.dart';
import 'package:law_sphere/core/errors/failure.dart';
import 'package:law_sphere/features/login/data/repo/login_repo.dart';
import '../models/login_response.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiConsumer api;

  LoginRepoImpl(this.api);

  @override
  Future<Either<Failure, LoginResponse>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await api.post(
        Endpoints.login,
        data: {'email': email, 'password': password},
        isFromData: false,
      );
      return Right(LoginResponse.fromJson(response));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioExceptio(e));
    } on SocketException {
      return Left(ServerFailure('No internet connection'));
    } catch (_) {
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }
}
