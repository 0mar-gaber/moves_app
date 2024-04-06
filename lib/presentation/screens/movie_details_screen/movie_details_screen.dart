import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/reusable_components/move_details_casing_component.dart';
import '../../../core/reusable_components/move_details_component.dart';
import '../../../core/reusable_components/recommended_component.dart';

class MovieDetails extends StatelessWidget {
  static const route = "MovieDetails";

  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dora and the lost city of gold",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white,size: 20.sp),
        toolbarHeight: 58.h,
      ),
      body: ListView(
        children: [
          const MovieDetailsCasing(),
          SizedBox(height: 20.h,),
          const MovieDetailsComponent(),

          SizedBox(height: 18.h,),
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
          SizedBox(height: 40.h,),
        ],
      ),
    );
  }
}
