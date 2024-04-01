import 'package:flutter/material.dart';
import 'package:moves_app/theme/app_colors.dart';

class AppTheme{
  static ThemeData theme =ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      background: AppColors.backGroundColor,
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      onPrimaryContainer: AppColors.unselectedIconColor,
      primaryContainer: AppColors.bottomNavigationBarColor,
      onBackground:AppColors.onBackGroundColor



    ),
    scaffoldBackgroundColor: AppColors.backGroundColor,
    appBarTheme: const AppBarTheme(
      color: AppColors.bottomNavigationBarColor,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.secondaryColor,
      unselectedItemColor: AppColors.unselectedIconColor,
      backgroundColor: AppColors.bottomNavigationBarColor,
    ),


  );

}