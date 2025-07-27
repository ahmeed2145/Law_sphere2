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
import 'package:law_sphere/features/register/manager/level/level_cubit.dart';
import 'package:law_sphere/features/register/manager/register_cubit/register_cubit_cubit.dart';
import 'package:law_sphere/features/register/manager/register_cubit/register_cubit_state.dart';
import 'package:law_sphere/features/register/data/models/register_model.dart';
import 'package:law_sphere/features/register/manager/university_cubit/university_cubit.dart';
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
  String? selectedLevel;
  String? selectedUniversity;
  String? selectedLevelName;
  String? selectedUniversityName;
  final Map<String, String> levelMap = {};
  Map<String, String> universityMap = {};
  @override
  void initState() {
    super.initState();
    context.read<LevelCubit>().getLevels();
    context.read<UniversityCubit>().getUniversities();
  }

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
                        child: BlocBuilder<LevelCubit, LevelState>(
                          builder: (context, state) {
                            if (state is LevelLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is LevelLoaded) {
                              universityMap.clear();
                              levelMap.clear();
                              for (var level in state.levels) {
                                levelMap[level.name] = level.level.toString();
                              }
                              return DropdownButton<String>(
                                underline: SizedBox(),

                                isExpanded: true,
                                value: selectedLevelName,
                                hint: Text(S.of(context).academicStage),
                                items: levelMap.keys.map((name) {
                                  return DropdownMenuItem<String>(
                                    value: name,
                                    child: Text(name),
                                  );
                                }).toList(),
                                onChanged: (String? name) {
                                  setState(() {
                                    selectedLevelName = name!;
                                    selectedLevel = levelMap[name];
                                  });
                                },
                              );
                            } else {
                              return const Text("حدث خطأ في تحميل البيانات");
                            }
                          },
                        ),
                      ),
                      verticalSpace(15),
                      SizedBox(
                        width: 400.h,
                        child: BlocBuilder<UniversityCubit, UniversityState>(
                          builder: (context, state) {
                            if (state is UniversityLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is UniversitySuccess) {
                              universityMap.clear();
                              for (var uni in state.universities) {
                                universityMap[uni.name] = uni.id;
                              }

                              return DropdownButton<String>(
                                isExpanded: true,
                                value: selectedUniversity,
                                hint: Text(S.of(context).university),
                                items: universityMap.entries.map((entry) {
                                  return DropdownMenuItem<String>(
                                    value: entry.value,
                                    child: Text(entry.key),
                                  );
                                }).toList(),
                                onChanged: (String? id) {
                                  setState(() {
                                    selectedUniversity = id!;
                                  });
                                },
                              );
                            } else {
                              return const Text("حدث خطأ في تحميل الجامعات");
                            }
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
                                  print(
                                    'University name: ----------------r$selectedUniversity',
                                  );

                                  final model = RegisterModel(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    fullName: fullNameController.text,
                                    mobile: mobileController.text,
                                    role: 1,
                                    level: int.tryParse(selectedLevel!) ?? 0,
                                    university: selectedUniversity!,
                                  );

                                  context.read<RegisterCubit>().register(model);
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
