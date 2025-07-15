import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:law_sphere/core/styles/app_colors.dart';
import 'package:law_sphere/core/utils/assets.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.isPassword = false,
    this.suffixIcon,
    this.contentPadding,
    this.focusedBorder,
    this.controller,
    this.validator,
    this.labelText,
    this.labelStyle,
    this.enabledBorderSideColor,
    this.focusdBorderColor,
    this.hintStyle,
    this.fillColor,
    this.cursorColor,
    this.inputStyle,
    this.onTap,
    this.textColor,
    this.iconColor,
    this.isEnabled = true,
  });

  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final TextStyle? labelStyle;
  final Color? enabledBorderSideColor;
  final Color? focusdBorderColor;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final Color? cursorColor;
  final TextStyle? inputStyle;
  final String hintText;
  final bool isPassword;
  final String? suffixIcon;
  final String prefixIcon;
  final VoidCallback? onTap;
  final bool isEnabled;

  final Color? textColor; // NEW: Custom text color
  final Color? iconColor; // NEW: Custom icon color

  @override
  DynamicTextFieldState createState() => DynamicTextFieldState();
}

class DynamicTextFieldState extends State<AppTextFormField> {
  bool isEnabled = true;
  bool isFocused = false;
  bool isPasswordVisible = false;
  bool hasError = false;

  void toggleEnabled() {
    setState(() {
      isEnabled = !isEnabled;
    });
  }

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (focus) {
        setState(() {
          isFocused = focus;
        });
      },
      child: TextFormField(
        controller: widget.controller,
        validator: (value) {
          final error = widget.validator?.call(value);
          setState(() {
            hasError = error != null;
          });
          return error;
        },
        cursorColor: widget.cursorColor ?? AppColors.blackTextColor,
        enabled: widget.isEnabled,
        obscureText: widget.isPassword && !isPasswordVisible,
        textDirection: Directionality.of(context),
        style:
            widget.inputStyle ??
            TextStyle(
              color:
                  widget.textColor ??
                  (isFocused
                      ? AppColors.blackTextColor
                      : isEnabled
                      ? AppColors.hintTextColor
                      : Colors.amber),
            ),
        readOnly: widget.onTap != null,
        onTap: widget.onTap,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: widget.labelStyle,
          contentPadding:
              widget.contentPadding ??
              EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 12.0.h),
          hintTextDirection: Directionality.of(context),

          hintText: widget.hintText,
          hintStyle:
              widget.hintStyle ??
              TextStyle(
                color: isFocused
                    ? AppColors.blackTextColor
                    : isEnabled
                    ? AppColors.hintTextColor
                    : AppColors.hintTextColor,
              ),
          fillColor: widget.fillColor ?? AppColors.textFieldfillColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0.r)),
          ),
          focusedBorder:
              widget.focusedBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0.r)),
                borderSide: BorderSide(
                  color:
                      widget.focusdBorderColor ?? AppColors.textFieldfillColor,
                ),
              ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0.r)),
            borderSide: BorderSide(
              color: widget.focusdBorderColor ?? Colors.red,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0.r)),
            borderSide: BorderSide(
              color:
                  widget.enabledBorderSideColor ?? AppColors.textFieldfillColor,
            ),
          ),
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: togglePasswordVisibility,
                  child: SvgPicture.asset(
                    isPasswordVisible
                        ? Assets.svgsInvisibleEye
                        : Assets.svgsEye,
                    fit: BoxFit.scaleDown,
                    colorFilter: ColorFilter.mode(
                      widget.iconColor ??
                          (hasError
                              ? Colors.red
                              : isFocused
                              ? AppColors.primaryColor
                              : isEnabled
                              ? AppColors.hintTextColor
                              : Colors.grey),
                      BlendMode.srcIn,
                    ),
                  ),
                )
              : widget.suffixIcon != null
              ? SvgPicture.asset(
                  widget.suffixIcon!,
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                    widget.iconColor ??
                        (hasError
                            ? Colors.red
                            : isFocused
                            ? AppColors.primaryColor
                            : isEnabled
                            ? AppColors.hintTextColor
                            : Colors.grey),
                    BlendMode.srcIn,
                  ),
                )
              : null,
          prefixIcon: SvgPicture.asset(
            widget.prefixIcon,
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(
              widget.iconColor ??
                  (hasError
                      ? Colors.red
                      : isFocused
                      ? AppColors.primaryColor
                      : isEnabled
                      ? AppColors.hintTextColor
                      : Colors.grey),
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
