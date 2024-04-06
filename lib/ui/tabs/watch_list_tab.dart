import 'package:flutter/material.dart';

import '../reusable_components/movie_component.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height * 0.05,
        ),
        Container(
            margin: EdgeInsets.only(left: width * 0.02),
            child: Text("Watchlist",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w400))),
        Expanded(
          child: ListView.builder(
              // shrinkWrap: true,
              padding: EdgeInsets.all(width * 0.03),
              itemBuilder: (context, index) => const MovieWidget(),
              itemCount: 10),
        ),
      ],
    );
  }
}
