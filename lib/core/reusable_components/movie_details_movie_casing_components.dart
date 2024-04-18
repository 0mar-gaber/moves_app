import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moves_app/domain/entities/movie_entity.dart';
import 'package:provider/provider.dart';

import '../../presentation/shared_provider/shared_provider.dart';

class MovieDetailsMovieCasingComponents extends StatelessWidget {
  MoviesEntity moviesEntity ;
  MovieDetailsMovieCasingComponents({super.key,required this.moviesEntity});

  @override
  Widget build(BuildContext context) {
    SharedProvider sharedProvider = Provider.of<SharedProvider>(context);
    int? id = moviesEntity.id;
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
          var userId = FirebaseAuth.instance.currentUser?.uid;
          if(!sharedProvider.moviesList.contains(id)){
            sharedProvider.addToWatchList(userId!, id!);
          }else{
            sharedProvider.removeFromWatchList(userId!,id!);
          }
          },
        child: !sharedProvider.moviesList.contains(id)
            ? Stack(alignment: Alignment.center, children: [
          SvgPicture.asset("asset/icons/add_to_watch_list.svg",
              width: 27.w, height: 36.h),
          Icon(
            Icons.add,
            color: Colors.white,
            size: 11.04.sp,
          )
        ])
            : Stack(alignment: Alignment.center, children: [
          SvgPicture.asset(
            "asset/icons/add_to_watch_list.svg",
            width: 27.w,
            height: 36.h,
            colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.secondary,
                BlendMode.srcIn),
          ),
          Icon(Icons.done, color: Colors.white, size: 11.04.sp)
        ]),      )
    ]);
  }
}
