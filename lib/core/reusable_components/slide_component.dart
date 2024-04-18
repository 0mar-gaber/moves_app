import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/movie_entity.dart';
import '../../presentation/shared_provider/shared_provider.dart';

class SlideComponent extends StatelessWidget {
  MoviesEntity popularMovieEntity;

  SlideComponent({super.key, required this.popularMovieEntity});

  @override
  Widget build(BuildContext context) {
    SharedProvider sharedProvider = Provider.of<SharedProvider>(context);
    int? id = popularMovieEntity.id;
    String moviesYear =
        extractYearFromDate(popularMovieEntity.releaseDate ?? "2022-04-07");
    String moveMPAARating = getMPAARating(popularMovieEntity.adult ?? false);
    return Container(
      width: 412.w,
      height: 289.h,
      decoration: const BoxDecoration(),
      child: Stack(alignment: Alignment.bottomLeft, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(alignment: Alignment.center, children: [
              Image(
                image: NetworkImage(
                    "https://image.tmdb.org/t/p/w500/${popularMovieEntity.backdropPath}"),
                height: 217.h,
                width: 412.w,
                fit: BoxFit.fill,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_circle,
                    color: Colors.white,
                    size: 60.sp,
                  ))
            ]),
            Container(
              alignment: Alignment.bottomLeft,
              margin: REdgeInsets.only(top: 14, bottom: 43, left: 230),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    popularMovieEntity.title ?? "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "$moviesYear  $moveMPAARating ",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 10.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
            margin: REdgeInsets.only(top: 90, bottom: 24, left: 21, right: 262),
            child: Stack(children: [
              Image(
                image: NetworkImage(
                  "https://image.tmdb.org/t/p/w500/${popularMovieEntity.posterPath}",
                ),
                height: 199.sp,
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
                      ]),
              )
            ])),
      ]),
    );
  }

  String extractYearFromDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return dateTime.year.toString();
  }

  String getMPAARating(bool adult) {
    if (adult) {
      // For adult content
      return 'NC-17'; // Not suitable for viewers under 17
      // or 'X' for explicit adult content (though less common nowadays)
    } else {
      // For non-adult content
      return 'PG-13'; // Parental guidance suggested for viewers under 13
      // You could use 'PG' for general audiences or 'G' for all ages depending on content
    }
  }
}
