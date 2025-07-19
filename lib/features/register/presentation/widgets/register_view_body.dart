import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:law_sphere/core/routing/routes.dart';
import 'package:law_sphere/core/styles/app_colors.dart';
import 'package:law_sphere/core/styles/app_styles.dart';
import 'package:law_sphere/core/utils/assets.dart';
import 'package:law_sphere/core/widgets/app_text_button.dart';
import 'package:law_sphere/core/widgets/app_text_form_field.dart';
import 'package:law_sphere/core/widgets/custom_app_bar.dart';
import 'package:law_sphere/core/widgets/custom_snackbar.dart';
import 'package:law_sphere/core/styles/spacing.dart';
import 'package:law_sphere/features/register/manager/register_cubit/register_cubit_cubit.dart';
import 'package:law_sphere/features/register/manager/register_cubit/register_cubit_state.dart';
import 'package:law_sphere/features/register/data/models/register_model.dart';
import 'package:law_sphere/features/register/presentation/widgets/drop_down.dart';
import 'package:law_sphere/generated/l10n.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final mobileController = TextEditingController();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  int? selectedLevel;
  String? selectedUniversity;

  final Map<String, int> levelMap = {
    "الفرقة الأولى": 1,
    "الفرقة الثانية": 2,
    "الفرقة الثالثة": 3,
    "الفرقة الرابعة": 4,
  };

  final List<String> universities = [
    "جامعة المنيا",
    "جامعة القاهرة",
    "جامعة أسيوط",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            CustomSnackBar.success(
              context: context,
              message: S.of(context).createAccount,
            ),
          );
          Navigator.pushReplacementNamed(context, Routes.homeView);
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            CustomSnackBar.error(context: context, message: state.message),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: verticalSpace(50)),
              SliverToBoxAdapter(
                child: CustomAppBar(
                  text: S.of(context).createAccount,
                  needArrow: false,
                ),
              ),
              SliverToBoxAdapter(child: verticalSpace(32)),
              SliverToBoxAdapter(
                child: Form(
                  key: registerFormKey,
                  child: Column(
                    children: [
                      AppTextFormField(
                        controller: fullNameController,
                        prefixIcon: Assets.svgsUser,
                        hintText: S.of(context).name,
                        validator: _requiredValidator(context),
                        isPassword: false,
                      ),
                      verticalSpace(20),
                      AppTextFormField(
                        controller: emailController,
                        prefixIcon: Assets.svgsMail,
                        hintText: S.of(context).email,
                        validator: _requiredValidator(context),
                        isPassword: false,
                      ),
                      verticalSpace(15),
                      AppTextFormField(
                        controller: mobileController,
                        prefixIcon: Assets.svgsMobile,
                        hintText: S.of(context).phone,
                        validator: _requiredValidator(context),
                        isPassword: false,
                      ),
                      verticalSpace(15),
                      AppTextFormField(
                        controller: passwordController,
                        prefixIcon: Assets.svgsLock,
                        hintText: S.of(context).password,
                        validator: _requiredValidator(context),
                        isPassword: true,
                      ),
                      verticalSpace(20),

                      SizedBox(
                        width: 400.h,
                        child: DropDown<int>(
                          hint: S.of(context).academicStage,
                          items: levelMap.entries
                              .map(
                                (e) =>
                                    DropDownItem(label: e.key, value: e.value),
                              )
                              .toList(),
                          onChanged: (value) {
                            selectedLevel = value;
                          },
                        ),
                      ),
                      verticalSpace(15),

                      SizedBox(
                        width: 400.h,
                        child: DropDown<String>(
                          hint: S.of(context).university,
                          items: universities
                              .map((e) => DropDownItem(label: e, value: e))
                              .toList(),
                          onChanged: (value) {
                            selectedUniversity = value;
                          },
                        ),
                      ),
                      verticalSpace(30),

                      state is RegisterLoading
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(
                                AppColors.primaryColor,
                              ),
                            )
                          : AppTextButton(
                              buttonText: S.of(context).createAccount,
                              textStyle: AppStyles.styleMedium18.copyWith(
                                color: AppColors.whiteColor,
                              ),
                              onPressed: () {
                                if (registerFormKey.currentState?.validate() ??
                                    false) {
                                  if (selectedLevel == null ||
                                      selectedUniversity == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      CustomSnackBar.error(
                                        context: context,
                                        message: "يجب اختيار المرحلة والجامعة",
                                      ),
                                    );
                                    return;
                                  }
                                  final model = RegisterModel(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    fullName: fullNameController.text,
                                    mobile: mobileController.text,
                                    role: 1,
                                    level: selectedLevel!,
                                    university: selectedUniversity!,
                                  );
                                  context.read<RegisterCubit>().register(model);
                                }
                              },
                            ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(child: verticalSpace(20)),
             
            ],
          ),
        );
      },
    );
  }

  FormFieldValidator<String> _requiredValidator(BuildContext context) {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return S.of(context).thisFieldIsRequiered;
      }
      return null;
    };
  }
}

