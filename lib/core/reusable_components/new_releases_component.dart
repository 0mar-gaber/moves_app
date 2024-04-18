import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/movie_entity.dart';
import '../../presentation/shared_provider/shared_provider.dart';

class NewReleasesComponent extends StatelessWidget {
  MoviesEntity newReleasesEntity;

  NewReleasesComponent({super.key, required this.newReleasesEntity});

  @override
  Widget build(BuildContext context) {
    SharedProvider sharedProvider = Provider.of<SharedProvider>(context);
    int? id = newReleasesEntity.id;

    return Stack(children: [
      Image.network(
        "https://image.tmdb.org/t/p/w500${newReleasesEntity.posterPath}",
        height: 127.74.h,
        width: 96.87.w,
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
                      Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
                ),
                Icon(Icons.done, color: Colors.white, size: 11.04.sp)
              ]),
      )
    ]);
  }
}
