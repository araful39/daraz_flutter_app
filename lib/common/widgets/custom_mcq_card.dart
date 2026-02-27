import 'package:daraz_app/util/app_colors/app_colors.dart';
import 'package:daraz_app/util/app_images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMCQCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color? titleColor;
  final Color? bgColor;
  final VoidCallback suggetionTap;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  const CustomMCQCard({
    super.key,
    required this.title,
    this.bgColor,
    this.titleColor,
    this.height,
    this.width,
    required this.subTitle,
    required this.suggetionTap,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: height ?? 134.h,
        width: width ?? double.infinity,
        child: Container(
          padding: EdgeInsets.all(24.r),
          decoration: BoxDecoration(
            color: bgColor ?? AppColors.EADDD9,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: const Color(0xffE6E7EA), width: 0.87),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Image.asset(AppImages.arrow4, height: 48.h, width: 48.w),
              SizedBox(width: 16.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: titleColor ?? AppColors.blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      subTitle,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: titleColor ?? AppColors.blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              InkWell(
                onTap: suggetionTap,
                child: Image.asset(
                  AppImages.upArrow,
                  height: 32.h,
                  width: 32.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
