import 'package:flutter/material.dart';
import 'package:moves_app/shared/home_screen_provider.dart';
import 'package:moves_app/theme/app_theme.dart';
import 'package:moves_app/ui/home_screen.dart';
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
      },
      initialRoute: HomeScreen.route,
      theme: AppTheme.theme,
    );
  }
}
