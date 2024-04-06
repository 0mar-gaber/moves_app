import 'package:flutter/material.dart';
import 'package:moves_app/ui/reusable_components/move_details_component.dart';
import '../reusable_components/recommended_component.dart';
import '../reusable_components/move_details_casing_component.dart';

class MovieDetails extends StatelessWidget {
  static const route = "MovieDetails";

  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dora and the lost city of gold",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white,size: width*0.04),
        toolbarHeight: height*0.05,
      ),
      body: ListView(
        children: [
          const MovieDetailsCasing(),
          Container(
            margin: EdgeInsets.only(
              left: width * 0.017,
            ),
            child: const MovieDetailsComponent(),
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
    );
  }
}
