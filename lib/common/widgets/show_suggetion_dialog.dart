import 'package:daraz_app/util/app_colors/app_colors.dart';
import 'package:daraz_app/util/app_images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showCommunityDialog({
  required BuildContext context,
  required String title,
  required String subTile,
}) {
  showDialog(
    context: context,

    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(24.r),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        AppImages.cross,
                        height: 24.h,
                        width: 24.w,
                      ),
                    ),
                  ),

                  SizedBox(height: 16.h),

                  /// Title
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
                  ),

                  SizedBox(height: 12.h),

                  /// Description
                  Text(
                    subTile,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
