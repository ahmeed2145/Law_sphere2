part of 'requset_cubit_cubit.dart';

sealed class RequsetCubitState extends Equatable {
  const RequsetCubitState();

  @override
  List<Object> get props => [];
}

final class RequsetCubitInitial extends RequsetCubitState {}
class ForgotPasswordLoading extends RequsetCubitState {}
class ForgetPasswordSuccess extends RequsetCubitState{
  final String message;

  ForgetPasswordSuccess({required this.message});

}
class ForgotPasswordError extends RequsetCubitState {
  final String error;
  ForgotPasswordError(this.error);
}

