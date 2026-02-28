import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';
import '../constants/text_font_style.dart';

class FiltterCommonButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;

  const FiltterCommonButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor = AppColors.cFFFFFF,
    this.borderColor = AppColors.c440007,
    this.textColor = AppColors.c440007,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          side: BorderSide(color: borderColor, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          backgroundColor: backgroundColor,
        ),
        child: Text(
          title,
          style: TextFontStyle.textStylec13cInter600cFFFFFF.copyWith(
            color: textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
