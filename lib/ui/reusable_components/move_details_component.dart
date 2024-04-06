import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moves_app/ui/reusable_components/movie_type_component.dart';
import 'package:moves_app/ui/reusable_components/new_releases_component.dart';


class MovieDetailsComponent extends StatelessWidget {
  const MovieDetailsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const NewReleasesComponent(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Row(
                children: [
                  MovieTypeComponent(),
                  MovieTypeComponent(),
                  MovieTypeComponent(),
          
                ],
              ),
              const MovieTypeComponent(),
              Container(
                margin:EdgeInsets.only(left: width*0.014,top: height*0.01,right:width*0.014 ) ,
                child: Text("Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width*0.026,
                    fontWeight: FontWeight.w300
                  ),
                ),
              ),
              Container(
                margin:EdgeInsets.only(left: width*0.014,top: height*0.01) ,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("asset/icons/star-2.svg",width: width*0.03,),
                    SizedBox(width: width*0.01,),
                    Text("7.7",style: TextStyle(color: Colors.white,fontSize: width*0.03),)
                  ],
                ),
              ),
          
            ],
          ),
        )
      ],
    );
  }
}
