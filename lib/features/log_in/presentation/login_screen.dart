import 'dart:developer';

import 'package:daraz_app/common_wigdets/common_textform_flied.dart';
import 'package:daraz_app/constants/app_assets/assets_icons.dart';
import 'package:daraz_app/constants/app_assets/assets_image.dart';
import 'package:daraz_app/constants/app_colors.dart';
import 'package:daraz_app/constants/text_font_style.dart';
import 'package:daraz_app/helpers/ui_helpers.dart';
import 'package:daraz_app/networks/api_acess.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailTEController = TextEditingController(
    text: "mor_2314",
  );

  final TextEditingController passwordTEController = TextEditingController(
    text: "83r5^_",
  );

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    AssetsImages.loginImage,
                    height: 320.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 250.0),
                    child: Container(
                      width: double.infinity,
                      height: 590.h,
                      decoration: BoxDecoration(
                        color: AppColors.cFFFFFF,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 28.h),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'No account?',
                                  style: TextFontStyle
                                      .textStylec13cInter600cFFFFFF
                                      .copyWith(
                                        color: AppColors.c01150E,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                                TextSpan(
                                  text: ' Register here',
                                  style: TextFontStyle
                                      .textStylec13cInter600cFFFFFF
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColors.c440007,
                                        color: AppColors.c440007,
                                      ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 230.0),
                    child: Container(
                      width: 388.w,
                      height: 517.h,
                      decoration: BoxDecoration(
                        color: AppColors.c444141,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 230.h),
                    child: Center(
                      child: Column(
                        children: [
                          Image.asset(
                            AssetsIcons.directorIcon,
                            width: 80.w,
                            height: 80.h,
                          ),
                          UIHelper.verticalSpace(14.h),
                          Text(
                            'Welcome Back!',
                            style: TextFontStyle.textStylec13cInter600cFFFFFF
                                .copyWith(
                                  color: AppColors.cFFFFFF,
                                  fontSize: 24.sp,
                                ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Log in to continue with ',
                                  style: TextFontStyle
                                      .textStylec13cInter600cFFFFFF
                                      .copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                                TextSpan(
                                  text: 'Daraz App',
                                  style: TextFontStyle
                                      .textStylec13cInter600cFFFFFF
                                      .copyWith(
                                        color: AppColors.cF2CC56,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  UIHelper.verticalSpaceSmall,
                                  CommonTextFormField(
                                    controller: emailTEController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter your email".tr;
                                      }
                                    
                                      return null;
                                    },

                                    label: 'Email',
                                    hintText: 'Enter your email',
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(12.w),
                                      child: Image.asset(
                                        AssetsIcons.emailIcon,
                                        height: 16.w,
                                        width: 12.h,
                                      ),
                                    ),
                                  ),
                                  UIHelper.verticalSpace(18.h),
                                  CommonTextFormField(
                                    controller: passwordTEController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Password required".tr;
                                      }
                                      if (value.length < 6) {
                                        return "Password 6".tr;
                                      }
                                      return null;
                                    },

                                    label: 'Password',
                                    hintText: 'Enter your password',
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(12.w),
                                      child: Image.asset(
                                        AssetsIcons.lockIcon,
                                        height: 16.w,
                                        width: 12.h,
                                      ),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        isPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isPasswordVisible =
                                              !isPasswordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                  UIHelper.verticalSpace(18.h),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        'Forgot Password?',
                                        style: TextFontStyle
                                            .textStylec13cInter600cFFFFFF
                                            .copyWith(
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor:
                                                  AppColors.cFFFFFF,
                                              fontSize: 14.sp,
                                            ),
                                      ),
                                    ),
                                  ),
                                  UIHelper.verticalSpace(18.h),
                                  SizedBox(
                                    width: 357.w,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          log(
                                            "email: ${emailTEController.text.trim()}",
                                          );
                                          log(
                                            "password: ${passwordTEController.text.trim()}",
                                          );
                                       
                                          await loginRx.loginFunc(
                                            email:
                                                emailTEController.text.trim(),
                                            password:
                                                passwordTEController.text
                                                    .trim(),
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: AppColors.c666060,
                                        elevation: 0,
                                        backgroundColor: AppColors.C444141,
                                        padding: EdgeInsets.symmetric(
                                          vertical: 18.h,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10.r,
                                          ),
                                          side: BorderSide(
                                            color: AppColors.cFFFFFF,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        'Log In',
                                        style: TextFontStyle
                                            .textStylec13cInter600cFFFFFF
                                            .copyWith(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
