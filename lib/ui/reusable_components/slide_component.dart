import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideComponent extends StatelessWidget {
  const SlideComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      decoration: const BoxDecoration(),
      child: Stack(alignment: Alignment.bottomLeft, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image(
              image: const AssetImage("asset/image/casing.jpg"),
              fit: BoxFit.fitWidth,
              width: width,
            ),
            Container(
              margin: EdgeInsets.only(top: height * 0.014, right: width * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dora and the lost city of gold",
                    style:
                        TextStyle(color: Colors.white, fontSize: width * 0.025),
                  ),
                  Text(
                    "2019  PG-13  2h 7m",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: width * 0.015),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
            margin: EdgeInsets.only(left: width * 0.09),
            child: Stack(children: [
              Image(
                image: const AssetImage(
                  "asset/image/move_casing.png",
                ),
                height: height * 0.23,
                fit: BoxFit.fitHeight,
              ),
              InkWell(
                onTap: () {
                  /// TODO
                },
                child: Stack(
                  alignment: Alignment.center,
                    children:[
                      SvgPicture.asset("asset/icons/add_to_watch_list.svg", width: width*0.05,),
                      const Icon(Icons.add,color: Colors.white,)
                    ]
                ),
              )
            ])),
        Center(child: Container(
          margin: EdgeInsets.only(bottom: height*0.08),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.play_circle,color: Colors.white,size: width*0.2,))))
      ]),
    );
  }
}
