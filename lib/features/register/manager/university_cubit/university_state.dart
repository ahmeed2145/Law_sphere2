part of 'university_cubit.dart';

sealed class UniversityState extends Equatable {
  const UniversityState();

  @override
  List<Object> get props => [];
}

final class UniversityInitial extends UniversityState {}
final class UniversityLoading extends UniversityState {}
final class UniversitySuccess extends UniversityState {
  final List<UniversityModel> universities;

  const UniversitySuccess(this.universities);

  @override
  List<Object> get props => [universities];
}


class UniversityFailure extends UniversityState {
  final String error;

  UniversityFailure(this.error);
}
