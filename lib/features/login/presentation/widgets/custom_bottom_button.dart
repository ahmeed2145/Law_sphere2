import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:law_sphere/core/styles/app_colors.dart';
import 'package:law_sphere/core/styles/app_styles.dart';
import 'package:law_sphere/core/widgets/app_text_button.dart';

class CustomButtomButton extends StatelessWidget {
  const CustomButtomButton({
    super.key,
    required this.text,
    this.textColor,
    this.bottonColor,
    required this.onPressed,
  });

  final String text;
  final Color? textColor;
  final Color? bottonColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: AppTextButton(
        onPressed: onPressed,
        buttonText: text,
        textStyle: AppStyles.styleBold16.copyWith(
          fontWeight: FontWeight.normal,
          color: textColor ?? AppColors.blackTextColor,
        ),
        backgroundColor: bottonColor ?? const Color(0xffFDFFFC),
      ),
    );
  }
}
