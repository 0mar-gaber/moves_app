import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moves_app/shared/home_screen_provider.dart';
import 'package:moves_app/ui/tabs/browse_tap.dart';
import 'package:moves_app/ui/tabs/home_tap.dart';
import 'package:moves_app/ui/tabs/search_tap.dart';
import 'package:moves_app/ui/tabs/watch_list_tab.dart';
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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
          selectedFontSize: width*0.02,
          unselectedFontSize: width*0.02,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          fixedColor: homeScreenProvider.bottomNavBarItemColor,
          items: [
            bottomNavigationBarItem("asset/icons/Home icon.svg", "Home", context, 0,width),
            bottomNavigationBarItem("asset/icons/Search.svg", "Search", context, 1,width),
            bottomNavigationBarItem("asset/icons/Browse.svg", "Browse", context, 2,width),
            bottomNavigationBarItem("asset/icons/watch_list_icon.svg", "Watch List", context, 3,width),
          ],
          onTap: (index) {
            homeScreenProvider.changeSelectedItem(index);
          },
          currentIndex: homeScreenProvider.currentBottomNavBarItem,
        ),
      ),
    );
  }


  bottomNavigationBarItem(String svgUrl,String lapel,BuildContext context,int index , double width){
    HomeScreenProvider homeScreenProvider = Provider.of<HomeScreenProvider>(context,listen: false);

    BottomNavigationBarItem bottomNavigationBarItem = BottomNavigationBarItem(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        icon: SvgPicture.asset(
          svgUrl,
          width:width*0.06 ,
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
