import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/home_screen_provider.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenProvider provider=Provider.of(context);
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    String NewSearch;


    return Column(

  children: [
    Padding(
      padding: const EdgeInsets.only(top: 50.0,left: 20,right: 20),
      child:TextField(
      onChanged: ( value){
        NewSearch=value;
        provider.changeSearch(NewSearch);
      },
        decoration: InputDecoration(
          hintText: "   search...",
          hintStyle: TextStyle(color: Color(0xffFFFFFF)),
          filled: true,
          fillColor: Color(0xff514F4F),
          prefixIcon: Icon(Icons.search),
          prefixIconColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:  BorderSide(width: 1,color: Colors.white),

          )
        ),

      ),
    ),
    SizedBox(height: height*0.33,),
    Column(

      children: [
        Image.asset("asset/image/Icon material-local-movies.png"),
      Text("No Movies Found",style: TextStyle(color: Colors. white24)),
    ],),
  ],

    );
  }
}
