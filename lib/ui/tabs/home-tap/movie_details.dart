import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moves_app/ui/reusable_components/slide_component.dart';

import '../../home_screen.dart';
import '../../reusable_components/film_type.dart';
import '../../reusable_components/new_releases_component.dart';
import '../../reusable_components/recommended_component.dart';
import '../../reusable_components/slide_component-details.dart';


class MovieDetails extends StatelessWidget {
static const routeName="MovieDetails";

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pushNamed(context, HomeScreen.route);
            },
            icon: Icon(Icons.arrow_back,color: Colors.white,),
          ),
          title: Text("Dora and the lost city of gole",style: TextStyle(color: Colors.white),),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height*0.33 ,
                child:   ImageSlideshow(
                  height:height ,
                  width: width,
                  autoPlayInterval: 3000,
                  indicatorColor: Colors.transparent,
                  indicatorBackgroundColor:Colors.transparent ,
                  children: [
                    SlideComponentDetails(),
                    SlideComponentDetails(),
                    SlideComponentDetails(),
                  ],
                ),
              ),
          
          
             // SizedBox(height: 10,),
              Row(
                children: [
                  NewReleasesComponent(),
                  SizedBox(width: 8,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TypeOfFilm(),
                          SizedBox(width: 5,),
                          TypeOfFilm(),
                          SizedBox(width: 5,),
                          TypeOfFilm(),
                        ],),
                      TypeOfFilm(),
                      SizedBox(height: 5,),
                      Text("""Having spent most of her life \nexploring the jungle, nothing could\n prepare Dora for her most dangerous \nadventure yet — high school. """,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300,color: Color(0xffCBCBCB)),),
                      Row(
                        children: [
                          SvgPicture.asset("asset/icons/star-2.svg",width: 20),
                          SizedBox(width: 10,),
                          Text("7.7",style: TextStyle(color: Colors.white,fontSize:18 ),)
                        ],),
          
          
                    ],
                  ),
                ],
              ),
          
          
          
            Container(
              height: height* 0.4,
              color: Color(0xff282A28),
          
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Color(0xff282A28),
                      margin: EdgeInsets.only(
                          top: width*0.01,
                          bottom: width*0.01,
                          left: width*0.02
                      ),
                      child: Text("More Like This",style: TextStyle(color: Colors.white,fontSize: width*0.03),)),
                  Expanded(
          
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        RecommendedComponent(),
                        RecommendedComponent(),
                        RecommendedComponent(),
                        RecommendedComponent(),
                        RecommendedComponent(),
                        RecommendedComponent(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          
            ],
          ),
        ),
      );
  }
}
