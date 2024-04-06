import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moves_app/core/reusable_components/movie_details_movie_casing_components.dart';

import 'movie_type_component.dart';
import 'new_releases_component.dart';

class MovieDetailsComponent extends StatelessWidget {
  const MovieDetailsComponent({super.key});

  @override
  Widget build(BuildContext context) {

    return  Container(
      margin: REdgeInsets.only(left: 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MovieDetailsMovieCasingComponents(),
          Expanded(
            child: Container(
              margin: REdgeInsets.only(left: 11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Row(
                    children: [
                      MovieTypeComponent(),
                      MovieTypeComponent(),
                      MovieTypeComponent(),

                    ],
                  ),
                  const MovieTypeComponent(),
                  SizedBox(height:  10.h),
                  Container(
                    margin:REdgeInsets.only(
                        top: 13,
                        right:19
                    ) ,
                    child: Text("Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("asset/icons/star-2.svg",width: 20.w,height: 19.13.h,),
                      SizedBox(width: 7.w),
                      Text("7.7",style: TextStyle(color: Colors.white,fontSize: 18.sp),)
                    ],
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
