import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          children: [
            Stack(children: [
              Image(
                image: const AssetImage(
                  "asset/image/casing.jpg",
                ),
                height: height * 0.1,
                fit: BoxFit.fitHeight,
              ),
              InkWell(
                onTap: () {
                  /// TODO
                },
                child: Stack(alignment: Alignment.center, children: [
                  SvgPicture.asset(
                    "asset/icons/add_to_watch_list.svg",
                    width: width*0.03,
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.secondary,
                        BlendMode.srcIn),
                  ),
                  Icon(Icons.done, color: Colors.white, size: width * 0.02)
                ]),
              )
            ]),
            SizedBox(
              width: width * 0.02,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dora and the lost city of gold',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width*0.024
                    )
                ),
                SizedBox(height: height * 0.005),
                Text('2019',
                    style:TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: width*0.02
                    )
                ),
                SizedBox(height: height * 0.005),
                Text('Rosa Salazar, Christoph Waltz',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: width*0.02
                    ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Divider(
          height: 2,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        SizedBox(
          height: height * 0.02,
        ),
      ],
    );
  }
}
