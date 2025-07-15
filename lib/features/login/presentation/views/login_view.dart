import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:law_sphere/core/di/service_locator.dart';
import 'package:law_sphere/core/styles/app_colors.dart';
import 'package:law_sphere/features/login/data/repo/login_repo_imp.dart';
import 'package:law_sphere/features/login/manager/login_cubit/login_cubit.dart';
import 'package:law_sphere/features/login/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<LoginRepoImpl>()),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SafeArea(child: LoginViewBody()),

        
      ),
    );
  }
}
