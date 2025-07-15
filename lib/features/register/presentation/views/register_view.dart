import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:law_sphere/core/di/service_locator.dart';
import 'package:law_sphere/features/login/manager/register_cubit/register_cubit_cubit.dart';
import 'package:law_sphere/features/register/data/repo/register_repo_imp.dart';
import 'package:law_sphere/features/register/presentation/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt<RegisterRepoImpl>()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: RegisterViewBody()),
      ),
    );
  }
}
