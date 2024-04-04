import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moves_app/ui/reusable_components/recommended_component.dart';

import 'film_type.dart';
import 'new_releases_component.dart';

class SlideComponentDetails extends StatelessWidget {
  const SlideComponentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.height;

    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("asset/image/casing.jpg",
              height: height*0.3,
              fit: BoxFit.cover,
              width: width,     ),
            IconButton(onPressed:  (){},
                icon: Icon(Icons.play_circle,color: Colors.white,size: 60,) )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Dora and the lost city of gold",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18),),
              Text("2019  PG-13  2h 7m",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w200,fontSize: 10),),
            ],
          ),
        ),


      ],
    );
  }
}
