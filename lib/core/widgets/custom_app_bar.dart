import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:law_sphere/core/styles/app_colors.dart';
import 'package:law_sphere/core/styles/app_styles.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
    this.needArrow = true, this.color, this.textStyle,
  });

  final bool needArrow;
  final String? text;
  final Widget? icon;
  final void Function()? onPressed;
  final Color?color;
  final TextStyle? textStyle;


  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(color: widget.color,
      child: SizedBox(
        height: 48.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (widget.needArrow)
              Positioned(
                right: 0,
                child: IconButton(
                  onPressed: widget.onPressed ?? () => Navigator.pop(context),
                  icon:
                      widget.icon ??
                      const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.blackTextColor,
                      ),
                ),
              ),
            Center(
              child: Text(
            widget.text ?? '',
                style: widget.textStyle ??
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
