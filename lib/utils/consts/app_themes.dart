import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppThemes {
  static ThemeData theme = ThemeData(
    iconTheme: IconThemeData(size: 50,color: AppColors.white),
    primaryColor: AppColors.primary,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 26,
          color: AppColors.white),
      backgroundColor: AppColors.primary,
      iconTheme: IconThemeData(
        color: AppColors.white,
        size: 28
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
    ),
      textTheme: TextTheme(
        displaySmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 10,
            color: Color(0xFF79828B),
        ),
        displayMedium: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: AppColors.primary
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 22,
          color: AppColors.white
        ),
          titleLarge: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 26,
              color: Color(0xff4F5A69))));
}
