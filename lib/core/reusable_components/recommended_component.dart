import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/movie_entity.dart';
import '../../presentation/shared_provider/shared_provider.dart';

class RecommendedComponent extends StatelessWidget {
  MoviesEntity recommendedEntity;

  RecommendedComponent({super.key, required this.recommendedEntity});

  @override
  Widget build(BuildContext context) {
    String moviesYear =
        extractYearFromDate(recommendedEntity.releaseDate ?? "2022-04-07");
    String moveMPAARating = getMPAARating(recommendedEntity.adult ?? false);
    SharedProvider sharedProvider = Provider.of<SharedProvider>(context);
    int? id = recommendedEntity.id;
    return Container(
      width: 97.w,
      height: 184.h,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(4).w,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 3,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Image.network(
              "https://image.tmdb.org/t/p/w500/${recommendedEntity.posterPath}",
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
                            Theme.of(context).colorScheme.secondary,
                            BlendMode.srcIn),
                      ),
                      Icon(Icons.done, color: Colors.white, size: 11.04.sp)
                    ]),
            )
          ]),
          SizedBox(
            child: Container(
              margin: REdgeInsets.only(top: 5.26, left: 6, right: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "asset/icons/star-2.svg",
                        height: 13.6.h,
                      ),
                      SizedBox(width: 2.96.w),
                      Container(
                          margin: REdgeInsets.only(top: 3),
                          child: Text(
                            recommendedEntity.voteAverage!.toStringAsFixed(1),
                            style:
                                TextStyle(color: Colors.white, fontSize: 10.sp),
                          )),
                    ],
                  ),
                  Text(
                    recommendedEntity.title ?? "",
                    style: TextStyle(color: Colors.white, fontSize: 10.sp),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  SizedBox(height: 2.h),
                  Text("$moviesYear  $moveMPAARating",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 8.sp)),
                ],
              ),
            ),
          )
        ],
      ),
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
