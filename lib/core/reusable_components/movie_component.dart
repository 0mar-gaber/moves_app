import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          children: [
            Stack(children: [
              Image(
                image: const AssetImage(
                  "asset/image/casing.jpg",
                ),
                height: 89.h,
                width: 140.w,
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
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.secondary,
                        BlendMode.srcIn),
                  ),
                  Icon(Icons.done, color: Colors.white, size: 11.04.sp)
                ]),
              )
            ]),
            SizedBox(width: 10.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dora and the lost city of gold',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp
                    )
                ),
                SizedBox(height: 5.h),
                Text('2019',
                    style:TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 13.sp
                    )
                ),
                SizedBox(height: 5.h),
                Text('Rosa Salazar, Christoph Waltz',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 13.sp
                    ),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 13.5.h,),
        Divider(
          height: 2,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        SizedBox(height: 13.5.h,)

      ],
    );
  }
}
