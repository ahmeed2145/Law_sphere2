import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:law_sphere/core/di/service_locator.dart';
import 'package:law_sphere/features/login/data/models/forget_and_request_password/forget_password_requset_repoImpl.dart';
import 'package:law_sphere/features/login/manager/requstPassword/requset_cubit_cubit.dart';
import 'package:law_sphere/features/login/presentation/widgets/requst_reset_password_view_body.dart';

class RequstResetPasswordView extends StatelessWidget {
  const RequstResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
 create: (context) => RequsetCubitCubit(getIt<ResetPasswordRepoImpl>())  ,
     child: Scaffold(body: RequstResetPasswordViewBody()),
    );
  }
}
