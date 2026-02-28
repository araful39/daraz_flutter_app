import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:daraz_app/constants/app_colors.dart';

import '../constants/text_font_style.dart';

class CustomCalendarField extends StatefulWidget {
  final String label;
  final String hintText;
  final DateTime? initialDate;
  final Function(DateTime)? onDateSelected;

  const CustomCalendarField({
    super.key,
    required this.label,
    required this.hintText,
    this.initialDate,
    this.onDateSelected,
  });

  @override
  State<CustomCalendarField> createState() => _CustomCalendarFieldState();
}

class _CustomCalendarFieldState extends State<CustomCalendarField> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  Future<void> _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF440007), // Header color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Body text color
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(picked);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 Label
        Padding(
          padding: EdgeInsets.only(bottom: 6.h),
          child: Text(
            widget.label,
            style: TextFontStyle.textInter14Inter0xFF656060.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.c1D1112,
            ),
          ),
        ),

        // 🔹 TextField look-alike button
        InkWell(
          onTap: () => _pickDate(context),
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedDate != null
                      ? DateFormat('MMM dd, yyyy').format(selectedDate!)
                      : widget.hintText,
                  style: TextFontStyle.textInter14Inter0xFF656060.copyWith(
                    fontSize: 14.sp,
                    color: selectedDate != null
                        ? Colors.black87
                        : Colors.grey.shade600,
                  ),
                ),
                Icon(
                  Icons.calendar_today,
                  size: 20.sp,
                  color: AppColors.c666060,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
