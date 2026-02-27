

import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle style({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
    double height = 1.3,
    TextDecoration decoration = TextDecoration.none,
    Color? decorationColor,
    double? decorationThickness,
  }) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      decoration: decoration,
      decorationColor: decorationColor ?? color,
      decorationThickness: decorationThickness,
    );
  }

  // Ready-made styles
  static TextStyle heading34({
    FontWeight fontWeight = FontWeight.w700, // Roboto-Bold
    Color color = Colors.black,
  }) =>
      style(fontSize: 34, fontWeight: fontWeight, color: color);

  static TextStyle title24({
    FontWeight fontWeight = FontWeight.w600, // Roboto-Bold
    Color color = Colors.black,
  }) =>
      style(fontSize: 24, fontWeight: fontWeight, color: color);

  static TextStyle title18({
    FontWeight fontWeight = FontWeight.w600, // Roboto-Medium
    Color color = Colors.black,
  }) =>
      style(fontSize: 18, fontWeight: fontWeight, color: color);

  static TextStyle body16({
    FontWeight fontWeight = FontWeight.w400, // Roboto-Regular
    Color color = Colors.black,
  }) =>
      style(fontSize: 16, fontWeight: fontWeight, color: color);

  static TextStyle body14({
    FontWeight fontWeight = FontWeight.w400, // Roboto-Regular
    Color color = Colors.black,
  }) =>
      style(fontSize: 14, fontWeight: fontWeight, color: color);

  static TextStyle body12({
    FontWeight fontWeight = FontWeight.w400, // Roboto-Regular
    Color color = Colors.black,
  }) =>
      style(fontSize: 14, fontWeight: fontWeight, color: color);

  // Optional SemiBold shortcut
  static TextStyle body16SemiBold({
    Color color = Colors.black,
  }) =>
      style(fontSize: 16, fontWeight: FontWeight.w500, color: color); // Roboto-SemiBold
}
