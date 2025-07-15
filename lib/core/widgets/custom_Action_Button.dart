import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:law_sphere/core/styles/app_colors.dart';

class CustomActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? loadingIndicatorColor;

  const CustomActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.textStyle,
    this.backgroundColor,
    this.width,
    this.height,
    this.borderRadius,
    this.padding,
    this.loadingIndicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50.h,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            backgroundColor ?? AppColors.primaryColor,
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
            ),
          ),
          padding: WidgetStateProperty.all(
            padding ?? EdgeInsets.symmetric(vertical: 12.h),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: Center(
          child: isLoading
              ? SizedBox(
                  width: 24.r,
                  height: 24.r,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: loadingIndicatorColor ?? AppColors.whiteColor,
                  ),
                )
              : Text(
                
                  text,
                  style: textStyle ??
                      TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        
                      ),
                      textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}
