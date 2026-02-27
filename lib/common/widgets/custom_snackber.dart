
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showCustomSnackbar(String message,) {
  Get.snackbar(
    "Warning", // title
    message,   // message
    backgroundColor: Colors.redAccent,
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
    borderRadius: 8,
    duration: Duration(seconds: 2),
    animationDuration: Duration(milliseconds: 300),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOut,
  );
}


void showCustomSnackbar2({required String message, required String title}) {
  Get.snackbar(
    title, // title
    message,   // message
    backgroundColor: Colors.redAccent,
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
    borderRadius: 8,
    duration: Duration(seconds: 2),
    animationDuration: Duration(milliseconds: 300),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOut,
  );
}
