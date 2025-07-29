import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:law_sphere/core/api/endpoints.dart';
import 'package:law_sphere/core/errors/failure.dart';
import 'package:law_sphere/features/login/data/repo/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit(this.loginRepo) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());

    final result = await loginRepo.login(email, password);

    result.fold(
      (Failure failure) {
        emit(LoginFailure(failure.errorMessage));
      },
      (response) async {
        emit(LoginSuccess(response));

        const storage = FlutterSecureStorage();

        await storage.write(key: ApiKey.token, value: response.data.token);

        await storage.write(
          key: 'user',
          value: jsonEncode(response.data.user.toJson()),
        );

        await storage.write(key: 'isLoggedIn', value: 'true');
      },
    );
  }
}
