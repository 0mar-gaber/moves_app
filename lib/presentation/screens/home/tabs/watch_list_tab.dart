import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/reusable_components/movie_component.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: REdgeInsets.only(
                top:77.49 ,
                left: 17
            ),
            child: Text("Watchlist",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w400))),
        Expanded(
          child: ListView.builder(
              padding: REdgeInsets.only(
                  left: 20.5,
                  right: 33.5,
                  top: 15.51,
              ),
              itemBuilder: (context, index) => const MovieWidget(),
              itemCount: 10),
        ),
      ],
    );
  }
}
