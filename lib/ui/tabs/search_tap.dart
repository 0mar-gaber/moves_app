import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moves_app/ui/reusable_components/movie_component.dart';

class SearchTab extends StatefulWidget {
  SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  var searchController = TextEditingController();

  bool isTextFieldEmpty = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              left: width * 0.06, right: width * 0.06, top: width * 0.06),
          child: TextField(
            onChanged: (value) {
             setState(() {
               if(value.isEmpty){
                 isTextFieldEmpty = true ;
                 print(isTextFieldEmpty);
               }else{
                 isTextFieldEmpty = false ;
                 print(isTextFieldEmpty);
               }
             });
            },
            style: TextStyle(color: Colors.white, fontSize: width * 0.02),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 0.7),
                borderRadius: BorderRadius.circular(60),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0.7),
                borderRadius: BorderRadius.circular(60),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.all(width * 0.01),
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search_outlined)),
              ),
              prefixIconColor: Colors.white,
              hintText: "Search",
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: width * 0.023,
                fontWeight: FontWeight.w300,
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.errorContainer,
            ),
            controller: searchController,
          ),
        ),
        SizedBox(height: height*0.02,),
        Expanded(
          child: isTextFieldEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "asset/icons/film strip.svg",
                      width: width * 0.23,
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      "No movies found",
                      style: TextStyle(
                          color: Colors.white24, fontSize: height * 0.024),
                    ),
                  ],
                )
              : Container(
                margin:EdgeInsets.only(
                  left: width*0.04,
                  right: width*0.04,
                ) ,
                child: ListView.builder(
                    itemBuilder: (context, index) => const MovieWidget(),
                    itemCount: 1,
                  ),
              ),
        ),
      ],
    );
  }
}
