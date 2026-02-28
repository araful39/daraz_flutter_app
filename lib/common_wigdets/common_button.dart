import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:daraz_app/constants/app_colors.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double borderWidth;
  final VoidCallback? onTap;
  final Widget? prefixIcon; // ✅ Added
  final Widget? suffixIcon; // ✅ Added

  const CommonButton({
    super.key,
    required this.text,
    this.backgroundColor = AppColors.cF2CC56,
    this.textColor = AppColors.c440007,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
    this.onTap,
    this.prefixIcon, // ✅ Added
    this.suffixIcon, // ✅ Added
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: borderColor, width: borderWidth.w),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null) ...[prefixIcon!, SizedBox(width: 8.w)],
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (suffixIcon != null) ...[SizedBox(width: 8.w), suffixIcon!],
          ],
        ),
      ),
    );
  }
}
