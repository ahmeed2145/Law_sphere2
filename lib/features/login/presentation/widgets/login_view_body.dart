import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:law_sphere/core/routing/routes.dart';
import 'package:law_sphere/core/styles/app_colors.dart';
import 'package:law_sphere/core/styles/app_styles.dart';
import 'package:law_sphere/core/widgets/app_text_button.dart';
import 'package:law_sphere/core/widgets/app_text_form_field.dart';
import 'package:law_sphere/core/widgets/custom_app_bar.dart';
import 'package:law_sphere/core/widgets/custom_snackbar.dart';
import 'package:law_sphere/features/login/manager/login_cubit/login_cubit.dart';
import 'package:law_sphere/features/login/manager/login_cubit/login_state.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/styles/spacing.dart';

import '../../../../generated/l10n.dart';
import 'custom_bottom_button.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> signInFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            CustomSnackBar.success(
              context: context,
              message: S.of(context).loginSuccess,
            ),
          );
          Navigator.pushReplacementNamed(context, Routes.homeView);
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            CustomSnackBar.error(context: context, message: state.message),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: verticalSpace(60)),
              SliverToBoxAdapter(
                child: CustomAppBar(
                  text: S.of(context).login,
                  needArrow: false,
                ),
              ),
              SliverToBoxAdapter(child: verticalSpace(32)),
              SliverToBoxAdapter(
                child: Image.asset(
                  'assets/images/app_logo.png',
                  height: 80.h,
                  width: 80.w,
                ),
              ),
              SliverToBoxAdapter(child: verticalSpace(40)),
              SliverToBoxAdapter(
                child: Form(
                  key: signInFormKey,
                  child: Column(
                    children: [
                      AppTextFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return S.of(context).thisFieldIsRequiered;
                          }
                          return null;
                        },

                        prefixIcon: Assets.svgsUser,
                        controller: emailController,
                        hintText: S.of(context).email,
                        isPassword: false,
                      ),
                      verticalSpace(15),
                      AppTextFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return S.of(context).thisFieldIsRequiered;
                          }
                          return null;
                        },

                        prefixIcon: Assets.svgsLock,
                        controller: passwordController,
                        hintText: S.of(context).password,
                        isPassword: true,
                      ),
                      verticalSpace(32),
                      Padding(
                        padding:  EdgeInsets.only(left: 210.h),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: AppTextButton(
                            buttonText: S.of(context).forgetPasswoerd,
                                                
                            textStyle: TextStyle(
                              fontFamily: "GE SS TWO",
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            backgroundColor: AppColors.whiteColor,
                            onPressed: () {
                              Navigator.pushNamed(context, "/requstResetPasswordView");
                            },
                          ),
                        ),
                      ),

                      verticalSpace(32),
                      state is LoginLoading
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(
                                AppColors.primaryColor,
                              ),
                            )
                          : AppTextButton(
                              buttonText: S.of(context).login,
                              textStyle: AppStyles.styleMedium18.copyWith(
                                color: AppColors.whiteColor,
                              ),
                              onPressed: () {
                                if (signInFormKey.currentState?.validate() ??
                                    false) {
                                  context.read<LoginCubit>().login(
                                    emailController.text,
                                    passwordController.text,
                                  );
                                }
                              },
                            ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(child: verticalSpace(20)),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: CustomButtomButton(
                      text: S.of(context).createAccount,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.registerView);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
