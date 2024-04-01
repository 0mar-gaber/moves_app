import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class HomeScreenProvider extends ChangeNotifier{
  int currentBottomNavBarItem = 0 ;
  bool isBottomNavBarItemSelected =false ;
  Color bottomNavBarItemColor = AppColors.unselectedIconColor;
  changeSelectedItem(int newNavBarItem){
    currentBottomNavBarItem = newNavBarItem ;
    notifyListeners();
  }
  changeSelectedItemColor(int index){
    if(currentBottomNavBarItem==index){
      bottomNavBarItemColor = AppColors.secondaryColor;
      notifyListeners();
    }
  }

}