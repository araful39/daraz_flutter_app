import 'package:daraz_app/util/app_colors/app_colors.dart';
import 'package:daraz_app/util/text_style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryGreenColor, AppColors.primaryGreenColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 60.h),

              //  App Logo / Title
              Text(
                "Daraz App",
                style: AppTextStyle.body16SemiBold(color: AppColors.whiteColor),
              ),

              SizedBox(height: 10.h),

              Text(
                "Welcome Back ",
                style: AppTextStyle.heading34(color: AppColors.whiteColor),
              ),

              SizedBox(height: 40.h),

              //  White Card Section
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(25.r),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.r),
                      topRight: Radius.circular(35.r),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),

                        //  Email
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        ),

                        SizedBox(height: 20.h),

                        //  Password
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: const Icon(Icons.lock_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        ),

                        SizedBox(height: 30.h),

                        //  Login Button
                        SizedBox(
                          width: double.infinity,
                          height: 50.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryGreenColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            onPressed: () {
                              // Get.offAll(const CustomBottomBar());
                            },
                            child: Text(
                              "Login",
                              style: AppTextStyle.body14(
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 20.h),

                        // Sign Up
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account? "),
                            GestureDetector(
                              onTap: () {
                                // Get.to(const SignupScreen());
                              },
                              child: Text(
                                "Sign Up",
                                style: AppTextStyle.body16SemiBold(
                                  color: AppColors.primaryGreenColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
