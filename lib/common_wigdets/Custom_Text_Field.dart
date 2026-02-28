import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:daraz_app/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String labelw;
  final String hintText;
  final VoidCallback? onPressed;
  final TextEditingController? controller;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? prefixAsset;
  final String? suffixAsset;
  final Function(String)? onChanged;
  final int maxLines;
  final TextInputType? keyboardType;
  final VoidCallback? onSuffixTap;
  final int? charLimit;
  final bool? readOnly;
  final Widget? suffixWidget;

  const CustomTextField({
    super.key,
    required this.labelw,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixAsset,
    this.suffixAsset,
    this.onChanged,
    this.maxLines = 1,
    this.keyboardType,
    this.onSuffixTap,
    this.charLimit,
    this.readOnly,
    this.suffixWidget,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Widget? buildPrefixIcon() {
      if (prefixAsset != null) {
        return Padding(
          padding: EdgeInsets.all(10.w),
          child: GestureDetector(
            onTap: onSuffixTap,
            child: Image.asset(
              prefixAsset!,
              width: 18.w,
              height: 18.h,
              color: AppColors.c666060,
            ),
          ),
        );
      } else if (prefixIcon != null) {
        return Icon(prefixIcon, size: 20.sp, color: AppColors.c440007);
      }
      return null;
    }

    Widget? buildSuffixIcon() {
      if (suffixAsset != null) {
        final image = Image.asset(
          suffixAsset!,
          width: 18.w,
          height: 18.h,
          color: AppColors.c666060,
        );

        return Padding(padding: EdgeInsets.all(10.w), child: image);
      } else if (suffixIcon != null) {
        final icon = Icon(suffixIcon, size: 20.sp, color: AppColors.c440007);
        return onSuffixTap != null
            ? InkWell(
                onTap: onSuffixTap,
                child: Padding(padding: EdgeInsets.all(10.w), child: icon),
              )
            : Padding(padding: EdgeInsets.all(10.w), child: icon);
      }
      return null;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Label Text
        Padding(
          padding: EdgeInsets.only(bottom: 6.h),
          child: Text(
            labelw,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),

        /// TextField (wrapped with GestureDetector for tap)
        GestureDetector(
          onTap: onPressed, // 👈 triggers popup or any external action
          child: AbsorbPointer(
            absorbing:
                onPressed != null, // 👈 disables editing if onPressed is used
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              onChanged: onChanged,
              maxLines: maxLines,
              keyboardType: keyboardType,
              readOnly: readOnly ?? false,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: buildPrefixIcon(),
                suffixIcon: buildSuffixIcon(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                filled: true,
                fillColor: AppColors.cFFFFFF,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 14.h,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
