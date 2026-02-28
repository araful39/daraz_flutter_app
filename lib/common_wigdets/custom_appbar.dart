import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:daraz_app/constants/app_assets/assets_icons.dart';
import 'package:daraz_app/constants/app_colors.dart';
import 'package:daraz_app/constants/text_font_style.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final bool centerTitle;
  final List<Widget>? actions;
  final Color? bgColor;
  final Color? titleColor;
  final VoidCallback? onBackTap; //  New parameter added

  const CustomAppbar({
    super.key,
    required this.title,
    this.showBack = true,
    this.centerTitle = true,
    this.actions,
    this.bgColor,
    this.titleColor,
    this.onBackTap, //  Added here too
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor ?? AppColors.cFFFFFF,
      elevation: 0,
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      leading: showBack
          ? Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: InkWell(
                onTap:
                    onBackTap ??
                    () {
                      Get.back();
                    },
                borderRadius: BorderRadius.circular(267.r),
                child: Container(
                  height: 28.h,
                  width: 28.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.c1D1112, width: 1.2),
                  ),
                  child: Center(
                    child: Image.asset(
                      AssetsIcons.arrowBackIcon,
                      width: 6.w,
                      height: 12.h,
                      color: AppColors.c1D1112,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            )
          : null,
      title: Text(
        title,
        style: TextFontStyle.textStylec13cInter600cFFFFFF.copyWith(
          color: titleColor ?? AppColors.c1D1112,
          fontSize: 24.sp,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
