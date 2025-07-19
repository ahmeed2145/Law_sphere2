import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:law_sphere/features/login/data/models/forget_and_request_password/forget_password_requset_repoImpl.dart';

part 'requset_cubit_state.dart';

class RequsetCubitCubit extends Cubit<RequsetCubitState> {
  final ResetPasswordRepo repo;

  RequsetCubitCubit(this.repo) : super(RequsetCubitInitial());

  Future<void> sendResetLink(String email) async {
    emit(ForgotPasswordLoading());

    final result = await repo.requestResetLink(email);

    result.fold(
    (failure) => emit(ForgotPasswordError(failure.errorMessage)),
    (response) => emit(ForgetPasswordSuccess(message: response.message)),
  );
  }
}
