import 'package:flutter/material.dart';
import 'package:moves_app/ui/reusable_components/movie_component.dart';

class CategoryScreen extends StatelessWidget {
  static const String route = "category screen" ;
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Adventure",style: TextStyle(color: Colors.white,fontSize: width*0.03),),
        iconTheme: IconThemeData(color: Colors.white,size: width*0.04),
        toolbarHeight: height*0.05,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(width*0.03),
        itemBuilder: (context, index) => const MovieWidget(),
        itemCount: 10,
      ),
    );
  }
}
