import 'package:flutter/material.dart';
import 'package:daraz_app/constants/app_colors.dart';

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.c000311,
  scaffoldBackgroundColor: AppColors.c000311,
  colorScheme: const ColorScheme.dark(),
  appBarTheme: const AppBarTheme(backgroundColor: AppColors.c000311),
);
