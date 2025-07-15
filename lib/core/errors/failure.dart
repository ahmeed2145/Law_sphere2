import 'package:dio/dio.dart';
import 'package:law_sphere/core/errors/error_model.dart';
import 'package:law_sphere/core/function/is_arabic.dart';

abstract class Failure {
  final String errorMessage;
  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  final String? code;
  ServerFailure(super.errorMessage, {this.code});

  factory ServerFailure.fromDioExceptio(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          isArabic()
              ? 'انتهت مهلة الاتصال بخادم API'
              : 'Connection timeout with API server',
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(
          isArabic()
              ? 'انتهت مهلة الإرسال إلى خادم API'
              : 'Send timeout with API server',
        );
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          isArabic()
              ? 'انتهت مهلة الاستلام من خادم API'
              : 'Receive timeout with API server',
        );
      case DioExceptionType.badCertificate:
        return ServerFailure(
          isArabic() ? 'شهادة غير صالحة' : 'Bad certificate',
        );
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(
          isArabic()
              ? 'تم إلغاء الطلب إلى خادم API'
              : 'Request to API server was cancelled',
        );
      case DioExceptionType.connectionError:
        return ServerFailure(
          isArabic() ? 'خطأ في الاتصال' : 'Connection error',
        );
      case DioExceptionType.unknown:
        if (dioException.message?.contains('SocketException') ?? false) {
          return ServerFailure(
            isArabic() ? 'لا يوجد اتصال بالإنترنت' : 'No internet connection',
          );
        }
        return ServerFailure(
          isArabic()
              ? 'خطأ غير متوقع، يرجى المحاولة لاحقًا'
              : 'Unexpected error, please try again',
        );
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    try {
      final errorModel = ErrorModel.fromJson(response);

      if (statusCode == 400 || statusCode == 401) {
        if (errorModel.code == 'EmailIsNotExist' ||
            errorModel.code == 'PasswordIsNotCorrect') {
          return ServerFailure(
            isArabic()
                ? 'البريد الإلكتروني أو كلمة المرور خطأ'
                : 'Email or password is incorrect',
            code: errorModel.code,
          );
        }
      }

      if (statusCode == 404) {
        return ServerFailure(
          isArabic()
              ? 'الطلب غير موجود، يرجى المحاولة لاحقًا'
              : 'Your request was not found, please try later',
        );
      }

      if (statusCode == 500) {
        return ServerFailure(
          isArabic()
              ? 'خطأ في الخادم الداخلي، يرجى المحاولة لاحقًا'
              : 'Internal server error, please try later',
        );
      }

      if (statusCode == 422) {
        String errorDetails = '';
        if (response['data'] is Map) {
          (response['data'] as Map).forEach((key, value) {
            if (value is List) {
              errorDetails += '${value.join(', ')}\n';
            }
          });
        }
        return ServerFailure(errorDetails);
      }

      return ServerFailure(
        isArabic()
            ? 'حدث خطأ غير متوقع، يرجى المحاولة لاحقًا'
            : 'Unexpected error, please try again',
      );
    } catch (_) {
      return ServerFailure(
        isArabic()
            ? 'حدث خطأ غير متوقع، يرجى المحاولة لاحقًا'
            : 'Unexpected error, please try again',
      );
    }
  }
}
