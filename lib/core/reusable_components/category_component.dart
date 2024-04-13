import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_app/core/constant.dart';

class CategoryComponent extends StatelessWidget {
  int index ;
   CategoryComponent({super.key,required this.index});


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Image.network(
          Constants.genres[index]["imageUrl"],
          fit: BoxFit.cover,
          height: height,
          width: width,
        ),
        Container(
          color: const Color.fromRGBO(52, 53, 52, 0.5),
          child: Center(
            child: Text(Constants.genres[index]["name"],style: TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.w600),),
          ),
        )
      ],
    );
  }
}
