import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/reusable_components/new_releases_component.dart';
import '../../../../core/reusable_components/recommended_component.dart';
import '../../../../core/reusable_components/slide_component.dart';
import '../../movie_details_screen/movie_details_screen.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView(
      children:[ Column(
        children: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, MovieDetails.route);
            },
            child: CarouselSlider.builder(
              itemBuilder:(context, index, realIndex) => const SlideComponent() ,
              options: CarouselOptions(
                height: 327.h,
                autoPlay: true,
                viewportFraction: 1,
              ),
              itemCount: 6,
            ),
          ),
          Container(
            height: 200.h,
            color: Theme.of(context).colorScheme.onSurface,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: REdgeInsets.only(
                      top: 15.13,
                      left: 19
                    ),
                    child: Text("New Releases ",style: TextStyle(color: Colors.white,fontSize: 15.sp),)),
                Expanded(
                  child: ListView.separated(
                    padding: REdgeInsets.only(
                        top: 12.87,
                        left: 19,
                        bottom: 13.3,
                        right:19,
                    ),
                    itemBuilder: (context, index) => const NewReleasesComponent(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    separatorBuilder: (context, index) => SizedBox(width: 13.w,),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height:30.h),
          Container(
            height: 280.h,
            color: Theme.of(context).colorScheme.onSurface,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: REdgeInsets.only(
                        top: 10.13,
                        left: 17,
                    ),
                    child: Text("Recommended",style: TextStyle(color: Colors.white,fontSize: 15.sp),)),
                Expanded(
                  child: ListView.separated(
                    padding: REdgeInsets.only(
                        left: 17,
                        top: 14.87,
                        bottom: 17,
                        right: 17
                    ),
                    itemBuilder: (context, index) => const RecommendedComponent(),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(width:14.w ),
                    itemCount: 10,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 22.h,),

        ],
      ),
    ]);
  }
}
