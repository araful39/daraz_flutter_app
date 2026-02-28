import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:daraz_app/constants/app_colors.dart';
import 'package:daraz_app/constants/text_font_style.dart';
import 'package:daraz_app/helpers/ui_helpers.dart';

class CommonTextFormField extends StatefulWidget {
  final String label;
  final FocusNode? focusNode;
  final String hintText;
  final bool obscureText; // if externally controlled
  final bool isPassword; // for internal password visibility toggle
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final int? maxLines;
  final int? maxLength;
  final bool readOnly;
  final TextAlign textAlign;
  final VoidCallback? onTap;
  final bool showCursor;
  final Function(String)? onChanged; // ✅ new param

  const CommonTextFormField({
    super.key,
    required this.label,
    this.focusNode,
    required this.hintText,
    this.textAlign = TextAlign.start,
    this.obscureText = false,
    this.isPassword = false,
    this.controller,

    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.maxLength,
    this.readOnly = false,
    this.onTap,
    this.showCursor = true,
    this.onChanged, // ✅ default true
  });

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  void didUpdateWidget(CommonTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.obscureText != widget.obscureText && !widget.isPassword) {
      _isObscured = widget.obscureText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextFontStyle.textStylec14cPoppins500cFFFFFF.copyWith(),
        ),
        UIHelper.verticalSpace(8.h),
        TextFormField(
          focusNode: widget.focusNode,
          textAlign: widget.textAlign,
          controller: widget.controller,
          obscureText: widget.isPassword ? _isObscured : widget.obscureText,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          onFieldSubmitted: widget.onFieldSubmitted,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          showCursor: widget.showCursor, // ✅ added here
          decoration: InputDecoration(
            hintText: widget.hintText,
            filled: true,
            hintStyle: TextFontStyle.textStylec13cInter600cFFFFFF.copyWith(
              fontSize: 14.sp,
              color: AppColors.c666060,
              fontWeight: FontWeight.w500,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon:
                widget.suffixIcon ??
                (widget.isPassword
                    ? IconButton(
                        icon: Icon(
                          _isObscured ? Icons.visibility_off : Icons.visibility,
                          color: AppColors.c666060,
                        ),
                        onPressed: _toggleVisibility,
                      )
                    : null),
          ),
        ),
      ],
    );
  }
}
