import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_app/domain/entities/movie_entity.dart';

class MovieDetailsCasing extends StatelessWidget {
  MoviesEntity moviesEntity ;
  MovieDetailsCasing({super.key,required this.moviesEntity});

  @override
  Widget build(BuildContext context) {
    String moviesYear =extractYearFromDate(moviesEntity.releaseDate??"2022-04-07");
    String moveMPAARating  = getMPAARating(moviesEntity.adult??false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              "https://image.tmdb.org/t/p/w500${moviesEntity.backdropPath}",
              height: 217.h,
              fit: BoxFit.fill,
              width: 412.w,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.play_circle,
                    color: Colors.white, size: 60.sp))
          ],
        ),
        Container(
          margin: REdgeInsets.only(
            top: 13,
            left: 22,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                moviesEntity.title??"",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18.sp
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "$moviesYear  $moveMPAARating ",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                    fontSize: 10.sp
                ),
              ),
            ],
          ),
        ),
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
