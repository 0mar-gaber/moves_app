import 'package:flutter/material.dart';
import 'package:moves_app/shared/home_screen_provider.dart';
import 'package:moves_app/theme/app_theme.dart';
import 'package:moves_app/ui/screens/category_screen.dart';
import 'package:moves_app/ui/screens/home_screen.dart';
import 'package:moves_app/ui/screens/movie_details_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(const MovesApp());
}
class MovesApp extends StatelessWidget {
  const MovesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
