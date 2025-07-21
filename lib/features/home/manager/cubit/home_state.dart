part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}
final class HomeLoadind extends HomeState {}
final class HomeLoaded extends HomeState {
  final List <String>  subjectd;

  HomeLoaded(List<String> content, {required this.subjectd});
}

final class HomeError extends HomeState {
  final String massage;


  HomeError( {required this.massage});}


