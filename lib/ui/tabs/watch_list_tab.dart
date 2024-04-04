import 'package:flutter/material.dart';

import '../widget/movie_widget.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text("Watch List", style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                height: 650,
                width: double.infinity,
                child: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsetsDirectional.all(10),
                    itemBuilder: (context, index) => MovieWidget(),
                    separatorBuilder: (context, index) => Divider(height: 2, color: Theme.of(context).colorScheme.onBackground,),
                    itemCount: 10),
              )
            ],
          ),
        ],
      ),
    );
  }
}
