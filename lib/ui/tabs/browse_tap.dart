import 'package:flutter/material.dart';
import 'package:moves_app/ui/screens/category_screen.dart';
import '../reusable_components/category_component.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height*0.05,),

        Container(
            margin: EdgeInsets.only(
                left: width*0.02
            ),
            child: Text("Browse Category", style: TextStyle(color: Colors.white,fontSize: width*0.04,fontWeight: FontWeight.w400))),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
              left: width*0.03,
              right: width*0.03,
            ),
            child: GridView.builder(
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing:width*0.05,
                mainAxisSpacing: height*0.025,
                childAspectRatio: 1.9,
              ),

              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.pushNamed(context, CategoryScreen.route);
                },
                  child: const CategoryComponent()),
              itemCount: 8,

            ),
          )
        ),
      ],
    );
  }
}
