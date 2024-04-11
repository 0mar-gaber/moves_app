import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/reusable_components/movie_component.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  var searchController = TextEditingController();

  bool isTextFieldEmpty = true;

  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        Container(
          height: 48.h,
          margin: REdgeInsets.only(
              left: 35,
              right: 34,
              top: 43
          ),
          child: TextField(
            onChanged: (value) {
             setState(() {
               if(value.isEmpty){
                 isTextFieldEmpty = true ;
               }else{
                 isTextFieldEmpty = false ;
               }
             });
            },
            style: TextStyle(color: Colors.white, fontSize: 14.sp),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide:   BorderSide(color: Colors.white, width: 1.w),
                borderRadius: BorderRadius.circular(30).w,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.w),
                borderRadius: BorderRadius.circular(60),
              ),
              prefixIcon: Padding(
                padding: REdgeInsets.only(
                  left: 17,
                ),
                child: IconButton(
                    onPressed: () {}, icon:  Icon(Icons.search_outlined,size: 15.9.sp,)),
              ),
              prefixIconColor: Colors.white,
              hintText: "Search",
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.46),
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.errorContainer,
            ),
            controller: searchController,
          ),
        ),
        SizedBox(height: 29.h),
        Expanded(
          child: isTextFieldEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "asset/icons/film strip.svg",
                      width: 78.09.w,
                      height: 87.86.h,
                    ),
                    SizedBox(height: 10.64.h),
                    Text(
                      "No movies found",
                      style: TextStyle(
                          color: Colors.white24, fontSize: 13.sp),
                    ),
                  ],
                )
              : Container(
                margin:REdgeInsets.only(
                  left: 30,
                  right: 30,
                ) ,
                child: ListView.builder(
                    itemBuilder: (context, index) => const MovieWidget(),
                    itemCount: 5,
                  ),
              ),
        ),
      ],
    );
  }
}
