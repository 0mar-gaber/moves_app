import 'package:flutter/material.dart';
import '../reusable_components/new_releases_component.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(

        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text("Browse Category", style: Theme.of(context).textTheme.titleLarge),
              ],

            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsetsDirectional.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) => NewReleasesComponent(),
              itemCount: 20,

            )
          ),
        ],
      ),
    );
  }
}
