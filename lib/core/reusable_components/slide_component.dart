import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideComponent extends StatelessWidget {
  const SlideComponent({super.key});

  @override
  Widget build(BuildContext context) {
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
                image: const AssetImage("asset/image/casing.jpg"),
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
              margin:
                  REdgeInsets.only(top: 14, bottom: 43, left: 162, right: 56),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dora and the lost city of gold",
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "2019  PG-13  2h 7m",
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
                image: const AssetImage(
                  "asset/image/move_casing.png",
                ),
                height: 199.sp,
                width: 129.w,
                fit: BoxFit.fill,
              ),
              InkWell(
                onTap: () {
                  /// TODO
                },
                child: Stack(alignment: Alignment.center, children: [
                  SvgPicture.asset("asset/icons/add_to_watch_list.svg",
                      width: 27.w, height: 36.h),
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 11.04.sp,
                  )
                ]),
              )
            ])),
      ]),
    );
  }
}
