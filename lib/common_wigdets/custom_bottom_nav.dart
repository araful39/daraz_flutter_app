// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:daraz_app/constants/app_assets/assets_icons.dart';
// import 'package:daraz_app/constants/app_colors.dart';
// import 'package:daraz_app/features/event_flow/event/presentation/event_screen.dart';
// import 'package:daraz_app/features/home/presentasion/post_screen/widget/show_post_type_popup.dart';
// import 'package:daraz_app/features/messanger/presentation/messages_empty_screen.dart';
// import 'package:daraz_app/features/profile/user_profile_screen.dart';
// import 'package:daraz_app/helpers/ui_helpers.dart';
// import '../constants/text_font_style.dart';
// import '../features/home/presentasion/home_screen.dart';

// class CustomNavigation extends StatefulWidget {
//   const CustomNavigation({super.key, this.index});
//   final int? index;

//   @override
//   State<CustomNavigation> createState() => _CustomNavigationState();
// }

// class _CustomNavigationState extends State<CustomNavigation> {
//   late int _selectedIndex;

//   final List<Widget> _screens = const [
//     HomeScreen(),
//     EventScreen(),
//     PostTypePage(),
//     MessagesEmptyScreen(),
//     UserProfileScreen(),
//   ];

//   final List<String> _labels = ['Home', 'Events', 'Post', 'Message', 'Profile'];
//   final List<String> _icons = [
//     AssetsIcons.HomenIcon,
//     AssetsIcons.eventncon,
//     AssetsIcons.postnIcon,
//     AssetsIcons.messagenIcon,
//     AssetsIcons.profilenIcon,
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     log("-------------Widget index ----${widget.index}");
//     _selectedIndex = widget.index ?? 0;
//   }

//   @override
//   void didUpdateWidget(covariant CustomNavigation oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.index != null && widget.index != _selectedIndex) {
//       setState(() {
//         _selectedIndex = widget.index!;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_selectedIndex],
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           color: AppColors.cFFFFFF,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 5,
//               offset: const Offset(0, -1),
//             ),
//           ],
//         ),
//         padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 4.w),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: List.generate(_labels.length, (index) {
//             final isSelected = _selectedIndex == index;
//             final color = isSelected ? AppColors.c440007 : AppColors.c666060;

//             return GestureDetector(
//               onTap: () => _onItemTapped(index),
//               behavior: HitTestBehavior.translucent,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   ColorFiltered(
//                     colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
//                     child: Image.asset(
//                       _icons[index],
//                       height: 24.h,
//                       width: 24.w,
//                     ),
//                   ),
//                   UIHelper.verticalSpace(4.h),
//                   Text(
//                     _labels[index],
//                     style: TextFontStyle.textInter14Inter0xFF656060.copyWith(
//                       fontSize: 12.sp,
//                       fontWeight: FontWeight.w600,
//                       color: color,
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
