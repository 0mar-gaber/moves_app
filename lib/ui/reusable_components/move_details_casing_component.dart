import 'package:flutter/material.dart';

class MovieDetailsCasing extends StatelessWidget {
  const MovieDetailsCasing({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "asset/image/casing.jpg",
              height: height * 0.3,
              fit: BoxFit.cover,
              width: width,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.play_circle,
                    color: Colors.white, size: width * 0.1))
          ],
        ),
        Container(
          margin: EdgeInsets.all(width * 0.017),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dora and the lost city of gold",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: width * 0.03),
              ),
              SizedBox(height: height * 0.01),
              Text(
                "2019  PG-13  2h 7m",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                    fontSize: width * 0.016),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
