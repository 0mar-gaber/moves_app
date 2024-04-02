import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecommendedComponent extends StatelessWidget {
  const RecommendedComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
          boxShadow:  [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 3,
            ),
          ]
      ),
      margin: EdgeInsets.all(width * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Image(
              image: const AssetImage(
                "asset/image/move_casing.png",
              ),
              height: height * 0.23,
              width: width*0.31,
              fit: BoxFit.fitWidth,
            ),
            InkWell(
              onTap: () {
                /// TODO
              },
              child: Stack(alignment: Alignment.center, children: [
                SvgPicture.asset(
                  "asset/icons/add_to_watch_list.svg",
                  width: width * 0.05,
                ),
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: width * 0.03,
                )
              ]),
            )
          ]),
          SizedBox(
            width: width*0.31,
            child: Container(
              margin: EdgeInsets.all(width*0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("asset/icons/star-2.svg",width: width*0.019,),
                      SizedBox(width: width*0.006,),
                      Text("7.7",style: TextStyle(color: Colors.white,fontSize: width*0.019),),
                    ],
                  ),
                  SizedBox(height: height*0.006,),
                  Text("Dora and the lost city of gold",style: TextStyle(color: Colors.white,fontSize: width*0.022),),
                  SizedBox(height: height*0.006,),
                  Text("2018  R  1h 59m",style: TextStyle(color: Theme.of(context).colorScheme.onBackground,fontSize: width*0.022)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
