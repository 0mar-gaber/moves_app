import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moves_app/core/api/api_manger.dart';
import 'package:moves_app/core/firestore/firestore_manger.dart';
import 'package:moves_app/presentation/screens/home/home_screen_provider.dart';
import 'package:moves_app/presentation/screens/home/tabs/browse_tap.dart';
import 'package:moves_app/presentation/screens/home/tabs/home_tap/home_tap.dart';
import 'package:moves_app/presentation/screens/home/tabs/search_tab/search_tap.dart';
import 'package:moves_app/presentation/screens/home/tabs/watch_list_tab/watch_list_tab.dart';
import 'package:provider/provider.dart';





class HomeScreen extends StatelessWidget {
  static const route = "Home screen";

  HomeScreen({super.key});

   List<Widget> tabsList=[
     const HomeTab(),
     const SearchTab(),
     const BrowseTab(),
     const WatchListTab()
   ];

  @override
  Widget build(BuildContext context) {
    HomeScreenProvider homeScreenProvider = Provider.of<HomeScreenProvider>(context);


    return Scaffold(
      body: tabsList[homeScreenProvider.currentBottomNavBarItem],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black,blurRadius: 20)
          ],
        ),
        child: BottomNavigationBar(
          elevation: 10,
          selectedFontSize: 8.sp,
          unselectedFontSize: 8.sp,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          fixedColor: homeScreenProvider.bottomNavBarItemColor,
          items: [
            bottomNavigationBarItem("asset/icons/Home icon.svg", "Home", context, 0,25.45,20.25),
            bottomNavigationBarItem("asset/icons/Search.svg", "Search", context, 1,19.55,20.25),
            bottomNavigationBarItem("asset/icons/Browse.svg", "Browse", context, 2,26.13,21.25),
            bottomNavigationBarItem("asset/icons/watch_list_icon.svg", "Watch List", context, 3,17.67,22.16),
           ],
          onTap: (index) {
            homeScreenProvider.changeSelectedItem(index);
          },
          currentIndex: homeScreenProvider.currentBottomNavBarItem,
        ),
      ),
    );
  }


  bottomNavigationBarItem(String svgUrl,String lapel,BuildContext context,int index , double width,double height){
    HomeScreenProvider homeScreenProvider = Provider.of<HomeScreenProvider>(context,listen: false);

    BottomNavigationBarItem bottomNavigationBarItem = BottomNavigationBarItem(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        icon: SvgPicture.asset(
          svgUrl,
          width:width.w,
          height: height.h,
          colorFilter: ColorFilter.mode(
            homeScreenProvider.currentBottomNavBarItem==index
                ?Theme.of(context).colorScheme.secondary
                :Theme.of(context).colorScheme.onPrimaryContainer,
              BlendMode.srcIn
          ),
        ),
        label: lapel);
    return bottomNavigationBarItem;
  }


}
