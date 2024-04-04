import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
          children: [
            Stack(children: [
              Image(
                image:  AssetImage("asset/image/casing.jpg",),
                height: 89,
               width: 140,
              ),
              InkWell(
                onTap: () {
                  /// TODO
                },
                child: Stack(
                    alignment: Alignment.center,
                    children:[
                      SvgPicture.asset("asset/icons/add_to_watch_list.svg",
                        width: 20,colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.secondary, BlendMode.srcIn),),
                      Icon(Icons.done,color: Colors.white,size: 10)
                    ]
                ),
              )
            ]),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Alita Battle Angel', style:Theme.of(context).textTheme.titleMedium),
                Text('2019', style:Theme.of(context).textTheme.titleSmall),
                Text('Rosa Salazar, Christoph Waltz', style:Theme.of(context).textTheme.titleSmall),
              ],
            )
          ],

      ),
    );
  }
}
