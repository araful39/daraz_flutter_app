import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:daraz_app/constants/app_colors.dart';
import 'package:daraz_app/constants/text_font_style.dart';
import 'package:daraz_app/helpers/ui_helpers.dart';

class CommonDropdownField<T> extends StatelessWidget {
  final String label;
  final String? hintText;
  final List<T> items;
  final T? value;
  final void Function(T?)? onChanged;
  final bool isEnabled;
  final Widget Function(T) builder;
  final String? Function(T?)? validator;

  const CommonDropdownField({
    super.key,
    required this.label,
    required this.items,
    this.hintText,
    this.value,
    this.onChanged,
    this.isEnabled = true,
    required this.builder,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Label
        Text(
          label,
          style: TextFontStyle.textStylec14cPoppins500cFFFFFF.copyWith(),
        ),

        UIHelper.verticalSpace(8.h),

        /// Dropdown container
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 8.h,
          ), // ⬅ smaller height
          decoration: BoxDecoration(
            color: AppColors.cF2EFFD,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: Colors.white.withOpacity(0.3), // subtle border
              width: 1.2,
            ),
          ),
          child: DropdownButtonFormField<T>(
            dropdownColor: AppColors.cF2EFFD,
            validator: validator,
            initialValue: value,
            isExpanded: true,
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.c666060,
              size: 22.sp,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero, // ⬅ extra spacing remove
            ),
            hint: Text(
              hintText ?? '',
              style: TextFontStyle.textStylec13cInter600cFFFFFF.copyWith(
                fontSize: 13.sp,
                color: AppColors.c666060,
                fontWeight: FontWeight.w500,
              ),
            ),
            items: items
                .map(
                  (item) =>
                      DropdownMenuItem<T>(value: item, child: builder(item)),
                )
                .toList(),
            onChanged: isEnabled ? (value) => onChanged?.call(value) : null,
          ),
        ),
      ],
    );
  }
}
