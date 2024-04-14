import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_app/core/constant.dart';

import '../../../../core/reusable_components/category_component.dart';
import '../../category_screen/category_screen.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: REdgeInsets.only(
                left: 17,
                top:77.49
            ),
            child: Text("Browse Category", style: TextStyle(color: Colors.white,fontSize: 22.sp,fontWeight: FontWeight.w400))),
        Expanded(
          child: Container(
            margin: REdgeInsets.only(
              top: 19.51,
              left: 17 ,
              right: 17,
            ),
            child: GridView.builder(
              padding: REdgeInsets.only(
                bottom: 20
              ),
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing:38.w,
                mainAxisSpacing: 47.h,
                childAspectRatio: 1.9,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.pushNamed(context, CategoryScreen.route,arguments: Constants.genres[index]);
                },
                  child:  CategoryComponent(index: index)),
              itemCount: Constants.genres.length,

            ),
          )
        ),
      ],
    );
  }
}
