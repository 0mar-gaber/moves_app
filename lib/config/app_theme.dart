import 'package:flutter/material.dart';
import '../core/utils/colors.dart';

class AppTheme{
  static ThemeData theme =ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      background: AppColors.backGroundColor,
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      onPrimaryContainer: AppColors.unselectedIconColor,
      primaryContainer: AppColors.bottomNavigationBarColor,
      onBackground:AppColors.onBackGroundColor,
      onSurfaceVariant: AppColors.sliderBackGroundColor,
      errorContainer: AppColors.searchBackGroundColor




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
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,



  );

}