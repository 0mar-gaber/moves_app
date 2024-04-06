import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetailsCasing extends StatelessWidget {
  const MovieDetailsCasing({super.key});

  @override
  Widget build(BuildContext context) {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "asset/image/casing.jpg",
              height: 217.h,
              fit: BoxFit.cover,
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
                "Dora and the lost city of gold",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18.sp
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "2019  PG-13  2h 7m",
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
}
