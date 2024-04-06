import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieTypeComponent extends StatelessWidget {
  const MovieTypeComponent({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: REdgeInsets.only(bottom: 3,right: 9),
      width: 65.w,
      height: 25.h,
      decoration: BoxDecoration(
        border: Border.all(
            color: Theme.of(context).colorScheme.errorContainer,
            width: 1.w
        ),
        borderRadius: const BorderRadius.all(Radius.circular(4)).w,
      ),
      child: Center(
        child: Text("Action",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300,fontSize: 10.sp)),
      ),
    );
  }
}
