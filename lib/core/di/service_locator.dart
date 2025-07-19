import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:law_sphere/core/api/dio_consumer.dart';
import 'package:law_sphere/core/api/endpoints.dart';
import 'package:law_sphere/core/secure/secure_storage_service.dart';
import 'package:law_sphere/features/login/data/models/forget_and_request_password/forget_password_requset_repoImpl.dart';
import 'package:law_sphere/features/login/data/repo/login_repo_imp.dart';
import 'package:law_sphere/features/register/data/repo/register_repo_imp.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<SecureStorageService>(SecureStorageService());

  getIt.registerSingleton<Dio>(() {
    final dio = Dio();
    dio.options.baseUrl = Endpoints.baseUrl;
    return dio;
  }());

  getIt.registerSingleton<DioConsumer>(
    DioConsumer(
      dio: getIt<Dio>(),
      secureStorageService: getIt<SecureStorageService>(),
    ),
  );

  getIt.registerSingleton<LoginRepoImpl>(
    LoginRepoImpl(getIt<DioConsumer>()),
  );

  getIt.registerSingleton<RegisterRepoImpl>(
    RegisterRepoImpl(getIt<DioConsumer>()),
  );

  getIt.registerSingleton<ResetPasswordRepo>(
    ResetPasswordRepoImpl(getIt<DioConsumer>()),
  );
}
