import 'package:flutter/material.dart';

class TypeOfFilm extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return    Container(
    padding: EdgeInsets.only(top: 2,bottom: 2,right: 10,left:10),
    decoration: BoxDecoration(
    border: Border.all(color:  Color(0xff514F4F),width: 2,style: BorderStyle.solid),
    borderRadius: BorderRadius.all( Radius.circular(2)),

    ),
    alignment: Alignment.topLeft,
    child: Text("Action",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w200)),
);
  }
}
