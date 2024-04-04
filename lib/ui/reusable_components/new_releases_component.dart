import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewReleasesComponent extends StatelessWidget {
  const NewReleasesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(width*0.009),
      child: Stack(
          children: [
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
                Icon(Icons.add,color: Colors.white,size: width*0.03,)
              ]
          ),
        )
      ]),
    );
  }
}
