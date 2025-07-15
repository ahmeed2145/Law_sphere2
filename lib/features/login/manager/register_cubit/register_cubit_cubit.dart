import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:law_sphere/core/errors/failure.dart';
import 'package:law_sphere/features/login/manager/register_cubit/register_cubit_state.dart';
import 'package:law_sphere/features/register/data/models/register_model.dart';
import 'package:law_sphere/features/register/data/models/register_respo.dart';
import 'package:law_sphere/features/register/data/repo/register_repo_imp.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepoImpl registerRepo;

  RegisterCubit(this.registerRepo) : super(RegisterInitial());

  Future<void> register(RegisterModel user) async {
    emit(RegisterLoading());

    final result = await registerRepo.register(user);

    result.fold(
      (Failure failure) {
        emit(RegisterFailure(failure.errorMessage));
      },
      (RegisterResponse response) async {
        emit(RegisterSuccess(response));

      
      },
    );
  }
}
