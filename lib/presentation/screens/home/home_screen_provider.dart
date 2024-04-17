import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';


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

  String searchQuery = "";
  bool isSearchEmpty = true ;
  changeSearchState(bool newState){
    isSearchEmpty = newState;
    notifyListeners();
  }
  changeSearchQuery(String newSearchQuery){
    if(newSearchQuery.isEmpty||newSearchQuery ==""){
      isSearchEmpty= true ;
      notifyListeners();

    }else{
      isSearchEmpty = false ;
      notifyListeners();

    }
    searchQuery = newSearchQuery ;
    notifyListeners();
  }

}