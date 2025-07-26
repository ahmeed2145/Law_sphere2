import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:law_sphere/core/di/service_locator.dart';
import 'package:law_sphere/features/register/manager/level/level_cubit.dart';
import 'package:law_sphere/features/register/manager/register_cubit/register_cubit_cubit.dart';
import 'package:law_sphere/features/register/data/repo/register_repo_imp.dart';
import 'package:law_sphere/features/register/manager/university_cubit/university_cubit.dart';
import 'package:law_sphere/features/register/presentation/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(getIt<RegisterRepoImpl>()),
        ),
        BlocProvider(
          create: (context) {
            final cubit = getIt<LevelCubit>();
            cubit.getLevels();
            return cubit;
          },
        ),
        BlocProvider(
          create: (context) {
            final universityCubit = getIt<UniversityCubit>();
            universityCubit.getUniversities();
            return universityCubit;
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: const SafeArea(child: RegisterViewBody()),
      ),
    );
  }
}
