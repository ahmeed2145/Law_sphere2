part of 'level_cubit.dart';

sealed class LevelState extends Equatable {
  const LevelState();

  @override
  List<Object> get props => [];
}

class LevelInitial extends LevelState {}

class LevelLoading extends LevelState {}

class LevelLoaded extends LevelState {
  final List<LevelModel> levels;

  const LevelLoaded(this.levels);

  @override
  List<Object> get props => [levels];
}

class LevelError extends LevelState {
  final String message;

  const LevelError(this.message);

  @override
  List<Object> get props => [message];
}
