import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:moves_app/ui/reusable_components/new_releases_component.dart';
import 'package:moves_app/ui/reusable_components/recommended_component.dart';
import 'package:moves_app/ui/reusable_components/slide_component.dart';
import 'package:moves_app/ui/tabs/home-tap/movie_details.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      children:[ Column(
        children: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, MovieDetails.routeName);
            },
            child: ImageSlideshow(
              height: height*0.39,
              isLoop: true,
              indicatorColor: Colors.transparent,
              indicatorBackgroundColor: Colors.transparent,
              autoPlayInterval: 3000,
              initialPage: 0,
              children: const [
                SlideComponent(),
                SlideComponent(),
                SlideComponent(),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Container(
            width: width,
            height: height*0.3,
            color: Theme.of(context).colorScheme.onSurface,
            child: Container(
              margin: EdgeInsets.only(
                  top: width*0.02,
                  bottom: width*0.02
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
                       NewReleasesComponent(),
                       NewReleasesComponent(),
                       NewReleasesComponent(),
                       NewReleasesComponent(),
                       NewReleasesComponent(),
                       NewReleasesComponent(),
                       NewReleasesComponent(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Container(
            width: width,
            height: height*0.4,
            color: Theme.of(context).colorScheme.onSurface,
            child: Container(
              margin: EdgeInsets.only(
                  top: width*0.02,
                  bottom: width*0.02
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
          ),
          SizedBox(
            height: height * 0.03,
          ),

        ],
      ),
    ]);
  }
}
