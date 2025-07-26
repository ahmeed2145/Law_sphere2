import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:law_sphere/features/register/data/models/level/level_model.dart';
import 'package:law_sphere/features/register/data/repo/level_repo.dart';

part 'level_state.dart';

class LevelCubit extends Cubit<LevelState> {
  final LevelRepo levelRepo;

  LevelCubit(this.levelRepo) : super(LevelInitial());

  Future<void> getLevels() async {
    emit(LevelLoading());
    try {
     final response = await levelRepo.fetchLevels();
emit(LevelLoaded(response.data));

    } catch (e) {
      emit(LevelError(e.toString()));
    }
  }
}
