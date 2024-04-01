import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moves_app/ui/reusable_components/slide_component.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const Expanded(
          flex: 2,
          child: ImageSlideshow(
            isLoop: true,
            indicatorColor: Colors.transparent,
            indicatorBackgroundColor: Colors.transparent,
            autoPlayInterval: 3000,
            initialPage: 0,
            children: [
              SlideComponent(),
              SlideComponent(),
              SlideComponent(),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.04,
        ),
        Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primary,
            )),
        SizedBox(
          height: height * 0.04,
        ),
        Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primary,
            )),
        SizedBox(
          height: height * 0.04,
        ),
      ],
    );
  }
}
