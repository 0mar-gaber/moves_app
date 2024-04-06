import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MovieDetailsMovieCasingComponents extends StatelessWidget {
  const MovieDetailsMovieCasingComponents({super.key});

  @override
  Widget build(BuildContext context) {

    return Stack(
        children: [
      Image(
        image: const AssetImage(
          "asset/image/move_casing.png",

        ),

        height: 199.h,
        width: 129.w,
        fit: BoxFit.fill,
      ),
      InkWell(
        onTap: () {
          /// TODO
        },
        child: Stack(
            alignment: Alignment.center,
            children:[
              SvgPicture.asset("asset/icons/add_to_watch_list.svg", width: 27.w,height: 36.h,),
              Icon(Icons.add,color: Colors.white,size: 11.04.sp,)
            ]
        ),
      )
    ]);
  }
}
