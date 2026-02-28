// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:daraz_app/constants/app_assets/assets_icons.dart';
// import 'package:daraz_app/constants/app_colors.dart';

// class FiltterDropdown extends StatefulWidget {
//   final String title;
//   final String? value;
//   final List<String> items;
//   final ValueChanged<String?> onChanged;

//   const FiltterDropdown({
//     super.key,
//     required this.title,
//     required this.value,
//     required this.items,
//     required this.onChanged,
//   });

//   @override
//   State<FiltterDropdown> createState() => _FiltterDropdownState();
// }

// class _FiltterDropdownState extends State<FiltterDropdown> {
//   OverlayEntry? _overlayEntry;
//   final LayerLink _layerLink = LayerLink();

//   void _showDropdown() {
//     final RenderBox renderBox = context.findRenderObject() as RenderBox;
//     final offset = renderBox.localToGlobal(Offset.zero);

//     _overlayEntry = OverlayEntry(
//       builder:
//           (context) => GestureDetector(
//             onTap: () => _overlayEntry?.remove(),
//             behavior: HitTestBehavior.translucent,
//             child: Stack(
//               children: [
//                 Positioned(
//                   left: offset.dx,
//                   top: offset.dy + renderBox.size.height + 6.h,
//                   width: renderBox.size.width,
//                   child: CompositedTransformFollower(
//                     link: _layerLink,
//                     showWhenUnlinked: false,
//                     child: Material(
//                       color: Colors.transparent,
//                       child: Container(
//                         padding: EdgeInsets.symmetric(
//                           vertical: 8.h,
//                           horizontal: 12.w,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(12.r),
//                           border: Border.all(
//                             color: Colors.grey.withOpacity(0.25),
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.08),
//                               blurRadius: 10,
//                               offset: const Offset(0, 4),
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Align(
//                               alignment: Alignment.topRight,
//                               child: InkWell(
//                                 onTap: () => _overlayEntry?.remove(),
//                                 borderRadius: BorderRadius.circular(50),
//                                 child: Container(
//                                   height: 24.h,
//                                   width: 24.w,
//                                   decoration: BoxDecoration(
//                                    border: Border.all(color: AppColors.c1D1112), // solid black background
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: Center(
//                                     child: Icon(
//                                       Icons.close,
//                                       size:
//                                           16.sp, // slightly smaller for better centering
//                                       color: AppColors.c1D1112, // white "X" icon
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 4.h),
//                             ...List.generate(widget.items.length, (index) {
//                               final item = widget.items[index];
//                               final isSelected = widget.value == item;

//                               return Column(
//                                 children: [
//                                   InkWell(
//                                     borderRadius: BorderRadius.circular(6.r),
//                                     onTap: () {
//                                       widget.onChanged(item);
//                                       _overlayEntry?.remove();
//                                     },
//                                     child: Padding(
//                                       padding: EdgeInsets.symmetric(
//                                         vertical: 10.h,
//                                       ),
//                                       child: Row(
//                                         children: [
//                                           if (isSelected) ...[
//                                             Icon(
//                                               Icons.check,
//                                               color: const Color(0xFF7C1E21),
//                                               size: 18.sp,
//                                             ),
//                                             SizedBox(width: 8.w),
//                                           ],
//                                           Expanded(
//                                             child: Text(
//                                               item,
//                                               style: TextStyle(
//                                                 fontSize: 15.sp,
//                                                 fontWeight:
//                                                     isSelected
//                                                         ? FontWeight.w600
//                                                         : FontWeight.w400,
//                                                 color:
//                                                     isSelected
//                                                         ? const Color(
//                                                           0xFF7C1E21,
//                                                         )
//                                                         : Colors.black
//                                                             .withOpacity(0.8),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   if (index != widget.items.length - 1)
//                                     Divider(
//                                       color: Colors.grey.withOpacity(0.25),
//                                       thickness: 0.8,
//                                       height: 0,
//                                     ),
//                                 ],
//                               );
//                             }),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//     );

//     Overlay.of(context).insert(_overlayEntry!);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         /// 🏷 Title label above the dropdown
//         Text(
//           widget.title,
//           style: TextStyle(
//             fontSize: 14.sp,
//             fontWeight: FontWeight.w600,
//             color: Colors.black87,
//           ),
//         ),
//         SizedBox(height: 6.h),

//         /// Dropdown container
//         CompositedTransformTarget(
//           link: _layerLink,
//           child: GestureDetector(
//             onTap: _showDropdown,
//             child: Container(
//               height: 48.h,
//               padding: EdgeInsets.symmetric(horizontal: 16.w),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(8.r),
//                 border: Border.all(color: Colors.grey.withOpacity(0.6)),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     widget.value ?? 'Select ${widget.title}',
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       color:
//                           widget.value == null
//                               ? Colors.black54
//                               : Colors.black87,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   Image.asset(
//                     AssetsIcons.arrowDownIcon1,
//                     height: 16.h,
//                     width: 16.w,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   void dispose() {
//     _overlayEntry?.remove();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:daraz_app/constants/app_colors.dart';

class FilterDropdown extends StatefulWidget {
  final String title;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const FilterDropdown({
    super.key,
    required this.title,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  State<FilterDropdown> createState() => _FilterDropdownState();
}

class _FilterDropdownState extends State<FilterDropdown> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  void _showDropdown() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () => _overlayEntry?.remove(),
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Positioned(
              left: offset.dx,
              top: offset.dy + renderBox.size.height + 6.h,
              width: renderBox.size.width,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Colors.grey.withOpacity(0.25)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () => _overlayEntry?.remove(),
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              height: 24.h,
                              width: 24.w,
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.c1D1112),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.close,
                                  size: 16.sp,
                                  color: AppColors.c1D1112,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        ...List.generate(widget.items.length, (index) {
                          final item = widget.items[index];
                          final isSelected = widget.value == item;

                          return Column(
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(6.r),
                                onTap: () {
                                  widget.onChanged(item);
                                  _overlayEntry?.remove();
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  child: Row(
                                    children: [
                                      if (isSelected) ...[
                                        Icon(
                                          Icons.check,
                                          color: const Color(0xFF7C1E21),
                                          size: 18.sp,
                                        ),
                                        SizedBox(width: 8.w),
                                      ],
                                      Expanded(
                                        child: Text(
                                          item,
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: isSelected
                                                ? FontWeight.w600
                                                : FontWeight.w400,
                                            color: isSelected
                                                ? const Color(0xFF7C1E21)
                                                : Colors.black.withOpacity(0.8),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (index != widget.items.length - 1)
                                Divider(
                                  color: Colors.grey.withOpacity(0.25),
                                  thickness: 0.8,
                                  height: 0,
                                ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 6.h),
        CompositedTransformTarget(
          link: _layerLink,
          child: GestureDetector(
            onTap: _showDropdown,
            child: Container(
              height: 48.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.grey.withOpacity(0.6)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.value ?? 'Select ${widget.title}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: widget.value == null
                          ? Colors.black54
                          : Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 20.sp,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
