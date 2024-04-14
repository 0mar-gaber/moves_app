import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/entities/movie_entity.dart';

class MovieWidget extends StatelessWidget {
  MoviesEntity moviesEntity ;
  MovieWidget({super.key,required this.moviesEntity});

  @override
  Widget build(BuildContext context) {
    String moviesYear =extractYearFromDate(moviesEntity.releaseDate??"2022-04-07");
    String moveMPAARating  = getMPAARating(moviesEntity.adult??false);
    return Column(
      children: [
        Row(
          children: [
            Stack(children: [
              SizedBox(
                width: 140.w,
                child: Image.network(
                 "https://image.tmdb.org/t/p/w500${moviesEntity.backdropPath}",
                  height: 89.h,
                  width: 140.w,
                  fit: BoxFit.fill,
                ),
              ),
              InkWell(
                onTap: () {
                  /// TODO
                },
                child: Stack(alignment: Alignment.center, children: [
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
            SizedBox(width: 10.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 246.7.w,
                  child: Text(moviesEntity.title??"",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp
                      )
                  ),
                ),
                SizedBox(height: 5.h),
                Text("$moviesYear  $moveMPAARating",
                    style:TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 13.sp
                    )
                ),
                SizedBox(height: 5.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("asset/icons/star-2.svg",width: 20.w,height: 19.13.h,),
                    SizedBox(width: 3.w),
                    Text(moviesEntity.voteAverage!.toStringAsFixed(1),style: TextStyle(color: Colors.white,fontSize: 14.sp),)
                  ],
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 13.5.h,),
        Divider(
          height: 2,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        SizedBox(height: 13.5.h,)

      ],
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
