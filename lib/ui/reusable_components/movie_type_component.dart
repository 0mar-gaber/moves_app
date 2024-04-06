import 'package:flutter/material.dart';

class MovieTypeComponent extends StatelessWidget {
  const MovieTypeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(width*0.01),
      width: width*0.15,
      height: height*0.037,
      decoration: BoxDecoration(
        border: Border.all(
            color: Theme.of(context).colorScheme.errorContainer,
            width: 2
        ),
        borderRadius: const BorderRadius.all(Radius.circular(9)),
      ),
      child: Center(
        child: Text("Action",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300,fontSize: width*0.027)),
      ),
    );
  }
}
