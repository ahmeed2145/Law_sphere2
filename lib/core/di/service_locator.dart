import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:law_sphere/core/api/dio_consumer.dart';
import 'package:law_sphere/core/api/endpoints.dart';
import 'package:law_sphere/core/secure/secure_storage_service.dart';

// ✅ Login & Reset
import 'package:law_sphere/features/login/data/models/forget_and_request_password/forget_password_requset_repoImpl.dart';
import 'package:law_sphere/features/login/data/repo/login_repo_imp.dart';

// ✅ Register
import 'package:law_sphere/features/register/data/repo/register_repo_imp.dart';

// ✅ Level
import 'package:law_sphere/features/register/data/repo/level_repo.dart';
import 'package:law_sphere/features/register/manager/level/level_cubit.dart';

// ✅ University
import 'package:law_sphere/features/register/data/repo/university_repo.dart';
import 'package:law_sphere/features/register/manager/university_cubit/university_cubit.dart';

final getIt = GetIt.instance;

void setup() {
  // ✅ Secure Storage
  getIt.registerSingleton<SecureStorageService>(SecureStorageService());

  // ✅ Dio
  getIt.registerSingleton<Dio>(() {
    final dio = Dio();
    dio.options.baseUrl = Endpoints.baseUrl;
    return dio;
  }());

  // ✅ Dio Consumer
  getIt.registerSingleton<DioConsumer>(
    DioConsumer(
      dio: getIt<Dio>(),
      secureStorageService: getIt<SecureStorageService>(),
    ),
  );

  // ✅ Auth & Register
  getIt.registerSingleton<LoginRepoImpl>(
    LoginRepoImpl(getIt<DioConsumer>()),
  );

  getIt.registerSingleton<RegisterRepoImpl>(
    RegisterRepoImpl(getIt<DioConsumer>()),
  );

  getIt.registerSingleton<ResetPasswordRepo>(
    ResetPasswordRepoImpl(getIt<DioConsumer>()),
  );

  // ✅ Level
  getIt.registerSingleton<LevelRepo>(
    LevelRepo(dio: getIt<Dio>()),
  );

  getIt.registerFactory<LevelCubit>(
    () => LevelCubit(getIt<LevelRepo>()),
  );

  // ✅ University
  getIt.registerSingleton<UniversityRepo>(
    UniversityRepoImpl(dio: getIt<Dio>()),
  );

  getIt.registerFactory<UniversityCubit>(
    () => UniversityCubit(getIt<UniversityRepo>()),
  );
}
