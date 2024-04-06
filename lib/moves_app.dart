import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_app/presentation/screens/category_screen/category_screen.dart';
import 'package:moves_app/presentation/screens/home/home_screen.dart';
import 'package:moves_app/presentation/screens/home/home_screen_provider.dart';
import 'package:moves_app/presentation/screens/movie_details_screen/movie_details_screen.dart';
import 'package:provider/provider.dart';

import 'config/theme/app_theme.dart';

class MovesApp extends StatelessWidget {
  const MovesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.route:(context)=>ChangeNotifierProvider(
              create: (context) => HomeScreenProvider(),
              child:  HomeScreen()),
          MovieDetails.route:(context) => const MovieDetails(),
          CategoryScreen.route:(context) => const CategoryScreen(),
        },
        initialRoute: HomeScreen.route,
        theme: AppTheme.theme,
      ),
    );
  }
}
