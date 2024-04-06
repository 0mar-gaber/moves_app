import 'package:flutter/material.dart';

class CategoryComponent extends StatelessWidget {
  const CategoryComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Image(image: const AssetImage("asset/image/casing.jpg",),fit: BoxFit.cover,height: height,),
        Container(
          color: const Color.fromRGBO(52, 53, 52, 0.5),
          child: Center(
            child: Text("Adventure",style: TextStyle(color: Colors.white,fontSize: width*0.03,fontWeight: FontWeight.w600),),
          ),
        )
      ],
    );
  }
}
