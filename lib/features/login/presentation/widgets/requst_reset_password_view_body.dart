import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:law_sphere/core/di/service_locator.dart'; // تأكد أن ملف الـ getIt موجود هنا
import 'package:law_sphere/core/widgets/custom_snackbar.dart';
import 'package:law_sphere/features/login/data/models/forget_and_request_password/forget_password_requset_repoImpl.dart';
import 'package:law_sphere/features/login/manager/requstPassword/requset_cubit_cubit.dart';
import 'package:law_sphere/generated/l10n.dart';
import 'package:law_sphere/core/widgets/app_text_button.dart';
import 'package:law_sphere/core/widgets/app_text_form_field.dart';
import 'package:law_sphere/core/styles/app_colors.dart';
import 'package:law_sphere/core/styles/app_styles.dart';
import 'package:law_sphere/core/styles/spacing.dart';

class RequstResetPasswordView extends StatelessWidget {
  const RequstResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequsetCubitCubit(getIt<ResetPasswordRepo>()),
      child: RequstResetPasswordViewBody(),
    );
  }
}

class RequstResetPasswordViewBody extends StatelessWidget {
  RequstResetPasswordViewBody({super.key});

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequsetCubitCubit, RequsetCubitState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            CustomSnackBar.success(
              context: context,
              message: state.message,
            ),
          );
        } else if (state is ForgotPasswordError) {
          ScaffoldMessenger.of(context).showSnackBar(
            CustomSnackBar.error(context: context, message: state.error),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextFormField(
                  controller: emailController,
                  hintText: S.of(context).email,
                  isPassword: false,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return S.of(context).thisFieldIsRequiered;
                    }
                    return null;
                  },
                  prefixIcon: '',
                ),
                verticalSpace(24),
                state is ForgotPasswordLoading
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
                      )
                    : AppTextButton(
                        buttonText: S.of(context).password,
                        textStyle: AppStyles.styleMedium18.copyWith(
                          color: AppColors.whiteColor,
                        ),
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            context.read<RequsetCubitCubit>().sendResetLink(
                                  emailController.text,
                                );
                          }
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
