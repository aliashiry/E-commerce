import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData mainTheme = ThemeData(
    primaryColor: AppColor.primaryColor,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColor.whiteColor,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColor.whiteColor,
      ),
    ),
  );
}
