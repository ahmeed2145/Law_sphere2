// university_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:law_sphere/features/register/data/models/university/university_model.dart';
import 'package:law_sphere/features/register/data/repo/university_repo.dart';

part 'university_state.dart';

class UniversityCubit extends Cubit<UniversityState> {
  final UniversityRepo universityRepo;

  UniversityCubit(this.universityRepo) : super(UniversityInitial());

  Future<void> getUniversities() async {
    emit(UniversityLoading());
    try {
      final universities = await universityRepo.fetchUniversities();
      emit(UniversitySuccess(universities));
    } catch (e) {
      emit(UniversityFailure(e.toString()));
    }
  }
}
