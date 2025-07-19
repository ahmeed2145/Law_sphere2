import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:law_sphere/core/api/dio_consumer.dart';
import 'package:law_sphere/core/api/endpoints.dart';
import 'package:law_sphere/core/errors/failure.dart';
import 'package:law_sphere/core/function/is_arabic.dart';
import 'package:law_sphere/features/login/data/models/forget_and_request_password/reset_password_response.dart';

abstract class ResetPasswordRepo {
  Future<Either<Failure, ResetPasswordResponse>> requestResetLink(String email);
}

class ResetPasswordRepoImpl implements ResetPasswordRepo {
  final DioConsumer dio;
  ResetPasswordRepoImpl(this.dio);

  @override
  Future<Either<Failure, ResetPasswordResponse>> requestResetLink(String email) async {
    try {
      final response = await dio.post(
        Endpoints.requstPassword,
        data: {'email': email},
      );

   final result = ResetPasswordResponse.fromJson(response.data);
return right(result);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioExceptio(e));
    } catch (e) {
      return left(ServerFailure(
        isArabic() ? 'حدث خطأ غير متوقع' : 'Unexpected error',
      ));
    }
  }
}