import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:law_sphere/core/function/is_arabic.dart';
import 'package:law_sphere/core/routing/routes.dart';
import 'package:law_sphere/core/styles/app_colors.dart';
import 'package:law_sphere/core/styles/app_styles.dart';
import 'package:law_sphere/core/styles/spacing.dart';
import 'package:law_sphere/core/widgets/app_text_button.dart';
import 'package:law_sphere/generated/l10n.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Stack(
          children: [
            Positioned(
              top: 16.h,
              right: isArabic() ? 0 : null,
              left: isArabic() ? null : 0,
              child: Image.asset(
                "assets/images/app_logo.png",
                width: 50.w,
                height: 50.h,
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpace(100),

                Image.asset(
                  'assets/images/onBoarding_image.png',
                  height: 250.h,
                  width: 250.w,
                ),

                verticalSpace(20),

                Text(
                  S.of(context).letsStart,
                  style: AppStyles.styleBold36.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 40.sp,
                  ),
                ),

                verticalSpace(8),

                Text(
                  S.of(context).onBoardingSlogan,
                  style: AppStyles.styleMedium16.copyWith(
                    color: AppColors.hintTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),

                const Spacer(),

                AppTextButton(
                  buttonText: S.of(context).createAccount,
                  textStyle: AppStyles.styleMedium16,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/RegisterView');
                  },
                ),

                verticalSpace(20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).alradyHasAccount,
                      style: AppStyles.styleLight16.copyWith(
                        color: AppColors.blackTextColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.loginView);
                      },
                      child: Text(
                        S.of(context).login,
                        style: AppStyles.styleLight16.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),

                verticalSpace(20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
