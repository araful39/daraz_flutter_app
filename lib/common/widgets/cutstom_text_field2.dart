import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../util/app_colors/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? toggleVisibility;
  final String? Function(String?)? validator;
  final Color? borderColor;
  final Color? fieldColor;
  final double? textSize;
  final TextAlign? textAlign;
  final double? height;
  final GestureTapCallback? onTap;
  final bool read;
  final dynamic radius;
  final VoidCallback? onRightTap;
  final TextInputType? inputType;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.leftIcon,
    this.rightIcon,
    this.isPassword = false,
    this.obscureText = false,
    this.toggleVisibility,
    this.radius = 10.0,
    this.validator,
    this.borderColor,
    this.fieldColor,
    this.textSize,
    this.textAlign = TextAlign.start,
    this.height = 46.0,
    this.read = false,
    this.onTap,
    this.onRightTap,this.inputType,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  bool _hasError = false;


  @override
  Widget build(BuildContext context) {
    final bool isLargeField = (widget.height ?? 52.h) > 100.h;
    return TextFormField(
      obscuringCharacter: "*",
      keyboardType:widget.inputType,
      controller: widget.controller,
      onChanged: widget.onChanged,
      readOnly: widget.read,


      obscureText: widget.isPassword && widget.obscureText,
      validator: (value) {
        final result = widget.validator?.call(value);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            setState(() {
              _hasError = result != null;
            });
          }
        });

        return result;
      },

      // ✅ FIX START
      enableInteractiveSelection: !widget.read,
      showCursor: !widget.read,
      contextMenuBuilder: widget.read
          ? (context, editableTextState) => const SizedBox.shrink()
          : null,
      // ✅ FIX END


      // validator: widget.validator,
      style: TextStyle(
        color: Colors.black,
        fontSize: widget.textSize ?? 14.sp,
        fontWeight: FontWeight.w400,
      ),
      cursorColor: Colors.black,
      textAlign: widget.textAlign ?? TextAlign.start,
      onTap: widget.onTap,
      maxLines: isLargeField ? null : 1,
      minLines: isLargeField ? 5 : 1,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.fieldColor ?? Colors.transparent,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: AppColors.c979797,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: widget.leftIcon != null
            ? Padding(
          padding: EdgeInsets.all(12.w),
          child: widget.leftIcon,
        )
            : null,
        suffixIcon: widget.isPassword
            ? GestureDetector(
          onTap: widget.toggleVisibility,
          child: Icon(
            widget.obscureText
                ? Icons.visibility_off
                : Icons.visibility,
            color: AppColors.c979797,
          ),
        )
            : (widget.rightIcon != null
            ? GestureDetector(
          onTap: widget.onRightTap,
          child: Padding(
            padding: EdgeInsets.only(left: 12.w,top: 12.h,bottom: 12.h,right: 10.w),
            child: widget.rightIcon,
          ),
        )
            : null),

        contentPadding: EdgeInsets.symmetric(
          horizontal: _hasError ? 6.w : 14.w,
          vertical: isLargeField ? 14.h : 0,
        ),


        // contentPadding: EdgeInsets.symmetric(
        //   horizontal: 14.w,
        //   vertical: isLargeField ? 14.h : 0,
        // ),

        errorStyle: TextStyle(
          fontSize: 12.sp,
          height: 1.1,
        ),



        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(
            color: widget.borderColor ?? const Color(0xffCFDBD5),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(
            color: widget.borderColor ?? const Color(0xffCFDBD5),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(
            color: widget.borderColor ?? Color(0xffCFDBD5),
            width: 1.2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: const BorderSide(color: Colors.red, width: 1.2),
        ),
      ),
    );
  }
}