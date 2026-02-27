// import 'package:daraz_app/util/app_images/app_images.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

// import '../../util/text_style/app_text_style.dart';

// class MyCustomDrawer extends StatelessWidget {
//   MyCustomDrawer({super.key});

//   // final CustomDrawerController controller = Get.put(CustomDrawerController());

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: Colors.white,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 30.h),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Image.asset(
//                   AppImages.slideLogo,
//                   height: 36.h,
//                   width: 100.w,
//                   fit: BoxFit.cover,
//                 ),

//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: SvgPicture.asset(
//                     AppImages.crossSvg,
//                     height: 20.h,
//                     width: 20.w,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 14.h),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24),
//             child: Container(
//               height: 1.h,
//               width: double.infinity,
//               color: Color(0xffe6e6e6),
//             ),
//           ),
//           SizedBox(height: 14.h),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24),
//             child: Text(
//               "Main Menu",
//               style: AppTextStyle.style(
//                 fontSize: 12.sp,
//                 fontWeight: FontWeight.w500,
//                 color: Color(0xff5F646D),
//               ),
//             ),
//           ),
//           SizedBox(height: 14.h),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 14),
//             child: Obx(
//               () => SizedBox(
//                 width: double.infinity,
//                 child: Column(
//                   children: [
//                     SlideSameFields(
//                       icon: AppImages.slideDashboard,
//                       color: controller.selectedScreen.value == "Dashboard"
//                           ? Color(0xfff6ece9)
//                           : Colors.transparent,
//                       title: "Dashboard",
//                       onTap: () {
//                         Get.toNamed(DashboardScreen.routeName);
//                         controller.selectScreenValue("Dashboard");
//                       },
//                     ),
//                     SlideSameFields(
//                       icon: AppImages.familyFlow,
//                       color: controller.selectedScreen.value == "Family Flow"
//                           ? Color(0xfff6ece9)
//                           : Colors.transparent,
//                       title: "Family Flow",
//                       onTap: () {
//                         Get.toNamed(FamilyFlowCalendarStyleScreen.routeName);
//                         controller.selectScreenValue("Family Flow");
//                       },
//                     ),
//                     SlideSameFields(
//                       icon: AppImages.slideCheck,
//                       color: controller.selectedScreen.value == "Chore Board"
//                           ? Color(0xfff6ece9)
//                           : Colors.transparent,
//                       title: "Chore Board",
//                       onTap: () {
//                         Get.toNamed(ChoreBoardScreen.routeName);
//                         controller.selectScreenValue("Chore Board");
//                       },
//                     ),
//                     SlideSameFields(
//                       icon: AppImages.slideLayer,
//                       color: controller.selectedScreen.value == "Home Scope"
//                           ? Color(0xfff6ece9)
//                           : Colors.transparent,
//                       title: "Home Scope",
//                       onTap: () {
//                         Get.toNamed(HomeScopeScreen.routeName);
//                         controller.selectScreenValue("Home Scope");
//                       },
//                     ),
//                     SlideSameFields(
//                       icon: AppImages.slideThunder,
//                       color: controller.selectedScreen.value == "WattSave"
//                           ? Color(0xfff6ece9)
//                           : Colors.transparent,
//                       title: "WattSave",
//                       onTap: () {
//                         Get.toNamed(WattSaveScreen.routeName);
//                         controller.selectScreenValue("WattSave");
//                       },
//                     ),
//                     SlideSameFields(
//                       icon: AppImages.slideBuilding,
//                       color: controller.selectedScreen.value == "Equity Insight"
//                           ? Color(0xfff6ece9)
//                           : Colors.transparent,
//                       title: "Equity Insight",
//                       onTap: () {
//                         Get.toNamed(EquityInsightScreen.routeName);
//                         controller.selectScreenValue("Equity Insight");
//                       },
//                     ),
//                     SlideSameFields(
//                       icon: AppImages.slideShield,
//                       color: controller.selectedScreen.value == "The Vault"
//                           ? Color(0xfff6ece9)
//                           : Colors.transparent,
//                       title: "The Vault",
//                       onTap: () {
//                         Get.toNamed(TheVaultScreen.routeName);
//                         controller.selectScreenValue("The Vault");
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 20.h),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24),
//             child: Text(
//               "Overview",
//               style: AppTextStyle.style(
//                 fontSize: 12.sp,
//                 fontWeight: FontWeight.w500,
//                 color: Color(0xff5F646D),
//               ),
//             ),
//           ),
//           SizedBox(height: 14.h),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 14),
//             child: SizedBox(
//               width: double.infinity,
//               child: Column(
//                 children: [
//                   SlideSameFields(
//                     icon: AppImages.slideFile,
//                     color: controller.selectedScreen.value == "Forum"
//                         ? Color(0xfff6ece9)
//                         : Colors.transparent,
//                     title: "Forum",
//                     onTap: () {
//                       Get.toNamed(CommunityScreen.routeName);
//                       controller.selectScreenValue("Forum");
//                     },
//                   ),
//                   SlideSameFields(
//                     icon: AppImages.slideMessage,
//                     color: controller.selectedScreen.value == "Get Support"
//                         ? Color(0xfff6ece9)
//                         : Colors.transparent,
//                     title: "Get Support",
//                     onTap: () {
//                       Get.toNamed(GetSupportScreen.routeName);
//                       controller.selectScreenValue("Get Support");
//                     },
//                   ),
//                   SlideSameFields(
//                     color: controller.selectedScreen.value == "Settings"
//                         ? Color(0xfff6ece9)
//                         : Colors.transparent,
//                     icon: AppImages.slideSetting,
//                     title: "Settings",
//                     onTap: () {
//                       Get.toNamed(SettingsScreen.routeName);
//                       controller.selectScreenValue("Settings");
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(child: SizedBox()),

//           Container(
//             height: 1,
//             width: double.infinity,
//             color: Color(0xffBFAEA6),
//           ),
//           SizedBox(height: 18.h),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 21),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     ClipOval(
//                       child: Image.asset(
//                         AppImages.profilePic,
//                         height: 20.h,
//                         width: 22.w,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     SizedBox(width: 10.w),
//                     Column(
//                       children: [
//                         Text(
//                           "Henry Richardson",
//                           style: AppTextStyle.style(
//                             fontSize: 14.sp,
//                             fontWeight: FontWeight.w700,
//                             color: Color(0xff121212),
//                           ),
//                         ),
//                         SizedBox(height: 4.h),
//                         Text(
//                           "Richardson Household",
//                           style: AppTextStyle.style(
//                             fontSize: 11.sp,
//                             fontWeight: FontWeight.w400,
//                             color: Color(0xff121212),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SvgPicture.asset(AppImages.logOut, height: 28.h, width: 28.w),
//               ],
//             ),
//           ),
//           SizedBox(height: 18.h),
//         ],
//       ),
//     );
//   }
// }

// class SlideSameFields extends StatelessWidget {
//   final dynamic icon;
//   final dynamic title;
//   final VoidCallback? onTap;
//   final Color color;
//   const SlideSameFields({
//     super.key,
//     required this.icon,
//     required this.title,
//     required this.onTap,
//     required this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 38.h,
//         width: double.infinity,
//         color: color,
//         child: Row(
//           children: [
//             SizedBox(width: 13.h),
//             SvgPicture.asset(icon, height: 20.h, width: 20.w),
//             SizedBox(width: 9.h),
//             Text(
//               title,
//               style: AppTextStyle.style(
//                 fontSize: 14.sp,
//                 fontWeight: FontWeight.w600,
//                 color: Color(0xff121212),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// //
