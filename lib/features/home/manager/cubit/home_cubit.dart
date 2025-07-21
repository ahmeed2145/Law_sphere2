import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:law_sphere/core/secure/secure_storage_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> loadUserLevelAndContent() async {
    emit(HomeLoadind());

    try {
      final levelStr = await SecureStorageService().getValue('user_level');
      
      if (levelStr != null) {
        final level = int.tryParse(levelStr);

        if (level != null) {
          final content = getContentForLevel(level);
                    final subjectd = getContentForLevel(level);

          emit(HomeLoaded(content, subjectd: subjectd));
        } else {
          emit(HomeError( massage: 'فشل في قراءة المرحلة الدراسية.',));
        }
      } else {
        emit(HomeError( massage: ' حدث خطا اثناء التحميل '));
      }
    } catch (e) {
      emit(HomeError( massage: '$e حدث خطا اثناء التحميل '));
    }
  }

  List<String> getContentForLevel(int level) {
    switch (level) {
      case 1:
        return ['مدخل قانون', 'تاريخ قانون'];
      case 2:
        return ['دستوري 2', 'إداري'];
      case 3:
        return ['مدني 2', 'جنائي'];
      case 4:
        return ['دولي خاص', 'تجاري'];
      default:
        return ['لا يوجد محتوى متاح لهذه المرحلة'];
    }
  }
}
