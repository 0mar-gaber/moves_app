import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_app/domain/entities/movie_entity.dart';

class MovieTypeComponent extends StatelessWidget {
  String genreName ;
  int index ;
  MovieTypeComponent({super.key,required this.genreName,required this.index});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: REdgeInsets.only(bottom: 3,right: 9),
      width: 65.w,
      decoration: BoxDecoration(
        border: Border.all(
            color: Theme.of(context).colorScheme.errorContainer,
            width: 1.w
        ),
        borderRadius: const BorderRadius.all(Radius.circular(4)).w,
      ),
      child: Center(
        child: Container(
          padding: REdgeInsets.all(2),
          child: Text(genreName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300,fontSize: 9.sp)),
        ),
      ),
    );
  }
}
