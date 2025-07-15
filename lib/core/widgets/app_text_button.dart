import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:law_sphere/core/styles/app_colors.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color? loadingIndicatorColor;
  final double? loadingIndicatorSize;

  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
    this.isLoading = false,
    this.loadingIndicatorColor,
    this.loadingIndicatorSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth ?? double.infinity,
      height: buttonHeight ?? 54.h,
      child: TextButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 13.0.r),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
            backgroundColor ?? AppColors.primaryColor,
          ),
          overlayColor: WidgetStateProperty.resolveWith<Color>(
            (states) => states.contains(WidgetState.pressed)
                ? (backgroundColor ?? AppColors.primaryColor).withOpacity(0.8)
                : Colors.transparent,
          ),
          padding: WidgetStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 0,
              vertical: verticalPadding ?? 0,
            ),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: Center(
          child: isLoading
              ? SizedBox(
                  width: loadingIndicatorSize ?? 24.r,
                  height: loadingIndicatorSize ?? 24.r,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: loadingIndicatorColor ?? AppColors.whiteColor,
                  ),
                )
              : Text(
                  buttonText,
                  style: textStyle,
                  overflow: TextOverflow.ellipsis,
                ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:law_sphere/core/styles/app_colors.dart';

// class AppTextButton extends StatelessWidget {
//   final double? borderRadius;
//   final Color? backgroundColor;
//   final double? horizontalPadding;
//   final double? verticalPadding;
//   final double? buttonWidth;
//   final double? buttonHeight;
//   final String buttonText;
//   final TextStyle textStyle;
//   final VoidCallback onPressed;
//   final bool isLoading;
//   final Color? loadingIndicatorColor;
//   final double? loadingIndicatorSize;

//   const AppTextButton({
//     super.key,
//     this.borderRadius,
//     this.backgroundColor,
//     this.horizontalPadding,
//     this.verticalPadding,
//     this.buttonHeight,
//     this.buttonWidth,
//     required this.buttonText,
//     required this.textStyle,
//     required this.onPressed,
//     this.isLoading = false,
//     this.loadingIndicatorColor,
//     this.loadingIndicatorSize,
//   }) : assert(buttonText != '', 'buttonText must not be empty');

//   @override
//   Widget build(BuildContext context) {
//     final effectiveBackgroundColor =
//         backgroundColor ?? Theme.of(context).primaryColor;

//     return SizedBox(
//       width: buttonWidth ?? double.infinity,
//       height: buttonHeight ?? kMinInteractiveDimension.h,
//       child: TextButton(
//         style: ButtonStyle(
//           shape: WidgetStateProperty.all<RoundedRectangleBorder>(
//             RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(borderRadius ?? 13.0.r),
//             ),
//           ),
//           backgroundColor: WidgetStatePropertyAll(effectiveBackgroundColor),
//           overlayColor: WidgetStateProperty.resolveWith<Color>(
//             (states) => states.contains(WidgetState.pressed)
//                 ? effectiveBackgroundColor.withOpacity(0.8)
//                 : Colors.transparent,
//           ),
//           padding: WidgetStateProperty.all<EdgeInsets>(
//             EdgeInsets.symmetric(
//               horizontal: horizontalPadding ?? 16.w,
//               vertical: verticalPadding ?? 10.h,
//             ),
//           ),
//         ),
//         onPressed: isLoading ? null : onPressed,
//         child: Center(
//           child: isLoading
//               ? SizedBox(
//                   width: loadingIndicatorSize ?? 24.r,
//                   height: loadingIndicatorSize ?? 24.r,
//                   child: CircularProgressIndicator(
//                     strokeWidth: 2.5,
//                     color: loadingIndicatorColor ?? AppColors.whiteColor,
//                   ),
//                 )
//               : Text(
//                   buttonText,
//                   style: textStyle,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//         ),
//       ),
//     );
//   }
// }
