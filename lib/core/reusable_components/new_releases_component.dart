import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/entities/movie_entity.dart';

class NewReleasesComponent extends StatelessWidget {
  MoviesEntity newReleasesEntity ;
  NewReleasesComponent({super.key,required this.newReleasesEntity});

  @override
  Widget build(BuildContext context) {

    return Stack(
        children: [
      Image.network(
        "https://image.tmdb.org/t/p/w500${newReleasesEntity.posterPath}",
        height: 127.74.h,
        width: 96.87.w,
        fit: BoxFit.fill,
      ),
      InkWell(
        onTap: () {
          // TODO : Implement add to watch list
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
