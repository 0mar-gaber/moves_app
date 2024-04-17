import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moves_app/domain/entities/movie_entity.dart';

class MovieDetailsMovieCasingComponents extends StatelessWidget {
  MoviesEntity moviesEntity ;
  MovieDetailsMovieCasingComponents({super.key,required this.moviesEntity});

  @override
  Widget build(BuildContext context) {

    return Stack(
        children: [
      Image.network(
        "https://image.tmdb.org/t/p/w500${moviesEntity.posterPath}",
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
