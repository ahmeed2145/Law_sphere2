import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:law_sphere/core/styles/app_colors.dart';
import 'package:law_sphere/core/styles/app_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
    this.needArrow = true,
    this.needDrawer = false,
    this.color,
    this.textStyle,
  });

  final bool needArrow;
  final bool needDrawer;
  final String? text;
  final Widget? icon;
  final void Function()? onPressed;
  final Color? color;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: SizedBox(
        height: 48.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (needDrawer)
              Positioned(
                left: 0,
                child: IconButton(
                  icon: const Icon(Icons.menu, color: AppColors.blackTextColor),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              )
            else if (needArrow)
              Positioned(
                right: 0,
                child: IconButton(
                  onPressed: onPressed ?? () => Navigator.pop(context),
                  icon: icon ??
                      const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.blackTextColor,
                      ),
                ),
              ),
            Center(
              child: Text(
                text ?? '',
                style: textStyle ??
                    AppStyles.styleMedium16.copyWith(
                      color: AppColors.blackTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
