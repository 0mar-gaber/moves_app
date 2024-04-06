import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RecommendedComponent extends StatelessWidget {
  const RecommendedComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 97.w,
      height: 184.h,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(4).w,
          boxShadow:  [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 3,
            ),
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Image(
              image: const AssetImage(
                "asset/image/move_casing.png",
              ),
              height: 127.74.h,
              width: 96.87.w,
              fit: BoxFit.fill,
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
                ),
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 11.04.sp,
                )
              ]),
            )
          ]),
          SizedBox(
            child: Container(
              margin: REdgeInsets.only(
                top: 5.26,
                left: 6,
                right: 2

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("asset/icons/star-2.svg",width: 10.04.w,height: 9.6.h,),
                      SizedBox(width: 4.96.w),
                      Text("7.7",style: TextStyle(color: Colors.white,fontSize: 10.sp),),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Text("Dora and the lost city of gold",style: TextStyle(color: Colors.white,fontSize: 10.sp),),
                  SizedBox(height: 2.h),
                  Text("2018  R  1h 59m",style: TextStyle(color: Theme.of(context).colorScheme.onBackground,fontSize: 8.sp)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
