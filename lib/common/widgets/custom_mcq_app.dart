import 'package:daraz_app/util/app_images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:daraz_app/util/app_colors/app_colors.dart';

class CustomMCQAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title; // nullable title
  final VoidCallback? onBackTap;
  final VoidCallback? onNotificationTap;

  const CustomMCQAppBar({
    super.key,
    this.title,
    this.onBackTap,
    this.onNotificationTap,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backGroundColor,
      elevation: 0,
      leading: GestureDetector(
        onTap: onBackTap ?? () => Navigator.pop(context),
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Image.asset(AppImages.backArrow, width: 16.w, height: 16.h),
        ),
      ),
      centerTitle: true,
      title: title != null
          ? Text(
              title!,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            )
          : null,
      actions: [
        GestureDetector(
          onTap: onNotificationTap,
          child: Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Image.asset(
              AppImages.notification,
              width: 24.w,
              height: 24.h,
            ),
          ),
        ),
      ],
    );
  }
}
