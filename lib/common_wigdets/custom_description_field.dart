import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:daraz_app/constants/app_colors.dart';
import '../constants/text_font_style.dart';

class CustomDescriptionField extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final int maxLength;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String labelw;
  final bool showBorder;

  const CustomDescriptionField({
    super.key,
    this.hintText = "Write your description...",
    this.maxLines = 5,
    this.maxLength = 1000,
    this.controller,
    this.onChanged,
    required this.labelw,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          labelw,
          style: TextFontStyle.textInter14Inter0xFF656060.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 6.h),

        // TextField Container
        TextField(
          controller: controller,
          onChanged: onChanged,
          maxLines: maxLines,
          maxLength: maxLength,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextFontStyle.textInter14Inter0xFF656060.copyWith(
              color: AppColors.c666060,
              fontSize: 14.sp,
            ),
            filled: true,
            fillColor: AppColors.cFFFFFF, // 🔹 Inner box is white
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 14.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: showBorder
                  ? BorderSide(color: Colors.grey.shade300)
                  : BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: showBorder
                  ? BorderSide(color: Colors.grey.shade300)
                  : BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: showBorder
                  ? BorderSide(color: Colors.blue, width: 1.2)
                  : BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
