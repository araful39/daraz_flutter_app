import 'package:daraz_app/util/app_colors/app_colors.dart';
import 'package:daraz_app/util/app_images/app_images.dart';
import 'package:daraz_app/util/text_style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final VoidCallback? onBackTap;
  final Widget? action;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBack = true,
    this.onBackTap,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      automaticallyImplyLeading: false,
      elevation: 1,
      //backgroundColor: AppColors.backGroundColor,
      leading: showBack
          ? Builder(
              builder: (context) {
                return GestureDetector(
                  onTap: onBackTap ?? () => Scaffold.of(context).openDrawer(),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 8.w,
                      bottom: 12.h,
                      top: 12.h,
                    ),
                    child: Image.asset(
                      AppImages.menu,
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                );
              },
            )
          : null,
      title: Text(title, style: AppTextStyle.title18()),
      centerTitle: false,
      actions: [
        if (action != null)
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: action!,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
